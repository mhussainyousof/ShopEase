import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ESingleAddress extends StatelessWidget {
  final bool selectedAddress;

  const ESingleAddress({required this.selectedAddress, super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final theme = Theme.of(context).textTheme;
    return ERoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? TColors.darkerGrey
              : TColors.grey,
              margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress ? dark ? TColors.light : TColors.dark : null,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hussain Yousof',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.titleLarge,
                      ),
                      SizedBox(height: TSizes.sm / 2),
                      Text('(+98) 902 571 9260', maxLines: 1, overflow: TextOverflow.ellipsis),
                      SizedBox(height: TSizes.sm / 2),
                      Text('23564 Yazd, Historical Part, Iran Country, Near TO Turkey',
                      softWrap: true,
                      
                      ),
                      SizedBox(height: TSizes.sm / 2),
                    ],

                  )
                ],
              ),
    );
  }
}
