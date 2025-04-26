import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const EProductQuantityWithAddAndRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
   
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ECircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: dark ? TColors.white : TColors.black,
          backgroundColor:
              dark ? TColors.darkerGrey : TColors.light,
              onPressed: remove,
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Text(quantity.toString(), style: theme.titleSmall),
        SizedBox(width: TSizes.spaceBtwItems),
        ECircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
