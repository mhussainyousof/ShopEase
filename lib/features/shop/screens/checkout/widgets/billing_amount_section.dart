import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class EBillingAmountSection extends StatelessWidget{
  const EBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: theme.bodyMedium),
            Text('\$256.0', style: theme.bodyMedium),

          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: theme.bodyMedium),
            Text('\$6.0', style: theme.labelLarge),

          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: theme.bodyMedium),
            Text('\$6.0', style: theme.labelLarge),

          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: theme.bodyMedium),
            Text('\$6.0', style: theme.titleMedium),

          ],
        ),
      ],
    );
  }

}