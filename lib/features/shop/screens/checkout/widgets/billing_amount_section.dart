import 'package:flutter/material.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/pricing_calculator.dart';

class EBillingAmountSection extends StatelessWidget{
  const EBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;


     final theme = Theme.of(context).textTheme;
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: theme.bodyMedium),
            Text('\$$subTotal', style: theme.bodyMedium),

          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
    Text('\$${TPricingCalculator.calculateShippingCost(subTotal, 'US')}', 
         style: Theme.of(context).textTheme.labelLarge),
  ],
), // Row

const SizedBox(height: TSizes.spaceBtwItems / 2),

/// Tax Fee
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
    Text('\$${TPricingCalculator.calculateTax(subTotal, 'US')}', 
         style: Theme.of(context).textTheme.labelLarge),
  ],
), // Row

const SizedBox(height: TSizes.spaceBtwItems / 2),

/// Order Total
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
    Text('\$${TPricingCalculator.calculateTotalPrice(subTotal, 'US')}', 
         style: Theme.of(context).textTheme.titleMedium),
  ],
), // Row
      ],
    );
  }

}