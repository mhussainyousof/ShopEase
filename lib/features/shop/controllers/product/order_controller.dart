import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/success_screen/success_screen.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/data/repositories/order/order_repository.dart';
import 'package:shop_ease/features/personalization/controllers/address_controller.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/features/shop/controllers/product/checkout_controller.dart';
import 'package:shop_ease/features/shop/models/order_model.dart';
import 'package:shop_ease/navigation_home.dart';
import 'package:shop_ease/utils/constants/enums.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Process and create new order
 // Process and create new order
Future<void> processOrder(double totalAmount) async {
  try {
    // Start Loader
    TFullScreenLoader.openLoadingDialog('Processing your order', TImages.pencilAnimation);

    // Get user authentication Id
    final userId = AuthenticationRepository.instance.authUser?.uid;
    if (userId == null || userId.isEmpty) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Create order details
    final order = OrderModel(
      id: UniqueKey().toString(),
      userId: userId,
      status: OrderStatus.pending,
      totalAmount: totalAmount,
      orderDate: DateTime.now(),
      paymentMethod: checkoutController.selectedPaymentMethod.value.name,
      address: addressController.selectedAddress.value,
      deliveryDate: DateTime.now().add(const Duration(days: 7)), // Example: 7 days delivery estimate
      items: cartController.cartItems.toList(),
    );

    // Save the order to Firestore
    await orderRepository.saveOrder(order, userId);

    // Update the cart status
    cartController.clearCart();

    // Stop Loader
    TFullScreenLoader.stopLoading();

    // Show Success screen
    Get.off(() => SuccessScreen(
      image: TImages.successfulPaymentIcon,
      title: 'Payment Success!',
      subTitle: 'Your item will be shipped soon!',
      onPressed: () => Get.offAll(() => const NavigationHome()),
    ));
  } catch (e) {
    // Stop Loader if still active
    TFullScreenLoader.stopLoading();
    
    // Show error message
    TLoaders.errorSnackBar(
      title: 'Order Failed',
      message: 'Something went wrong: ${e.toString()}'
    );
    
    // Re-throw for potential further handling
    rethrow;
  }
}
}