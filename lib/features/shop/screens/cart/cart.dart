import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/loaders/animation_loader.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop_ease/features/shop/screens/checkout/checkout.dart';
import 'package:shop_ease/navigation_home.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Cart', style: theme.headlineSmall),
      ),

      body: Obx(() {
        final emptyWidget = EAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY.',
          animation: TImages.pencilAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationHome()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),


       
              child: ECartItems(),
            ), 
          ); 
        }
      }),



      bottomNavigationBar:
      
      controller.cartItems.isEmpty ? SizedBox() :  Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace, vertical: 8),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => CheckoutScreen());
            },
            child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value}'))),
      ),
    );
  }
}
