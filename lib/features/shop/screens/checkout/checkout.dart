import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/products/cart/upon_widget.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/features/shop/controllers/product/order_controller.dart';
import 'package:shop_ease/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop_ease/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shop_ease/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shop_ease/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';
import 'package:shop_ease/utils/helpers/pricing_calculator.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final cartController = CartController.instance;
final subTotal = cartController.totalCartPrice.value;
final orderController = Get.put(OrderController());
final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');

    final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: theme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ECartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSections),
              ECouponCode(),
              SizedBox(height: TSizes.spaceBtwSections),
              ERoundedContainer(
                padding: EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    EBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),


                    EBillingsPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    EBillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // CHECKOUT BUTTON
bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(TSizes.defaultSpace),
  child: ElevatedButton(
    onPressed: subTotal > 0
        ? () => orderController.processOrder(totalAmount)
        : () => TLoaders.warningSnackBar(
              title: 'Empty Cart', 
              message: 'Add items to your cart to proceed.'
            ),
    child: Text('Checkout \$${totalAmount.toStringAsFixed(2)}'),
  ), // ElevatedButton
), // Padding
    );
  }
}
