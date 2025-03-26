import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

//! Shopping bag icon with an item count badge.
class BagCountWidget extends StatelessWidget {
  const BagCountWidget({
    required this.onPressed,
    this.iconColor,
    super.key,
  });

  final Color? iconColor; //! Color of the shopping bag icon
  final VoidCallback onPressed; //! Action when the icon is pressed

  @override
  Widget build(BuildContext context) {
  final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        //! Shopping bag icon button
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),

        //! Positioned item count badge
        Positioned(
          right: 5,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: dark ? TColors.light : TColors.dark, 
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? TColors.dark : TColors.light, 
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}





