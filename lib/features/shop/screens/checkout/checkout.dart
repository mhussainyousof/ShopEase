import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/products/cart/upon_widget.dart';
import 'package:shop_ease/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop_ease/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shop_ease/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shop_ease/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
