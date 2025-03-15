import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/device/device_utility.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';


class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, this.icon = Iconsax.search_normal,  required this.text,  this.showBackground = true,  this.showBorder = true,
  });

  final IconData? icon;
  final String text;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace - 2),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(TSizes.sm + 5),
        decoration: BoxDecoration(
            color: showBackground ? dark ? TColors.dark : TColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null
        ),
        child: Row(
          children: [
            Icon(icon, color: TColors.darkGrey,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text(text, style:Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
