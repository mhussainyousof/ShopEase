import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
      ERoundedImage(imageUrl: TImages.productImage1,
      width: 60,
      height: 60,
      padding: EdgeInsets.all(TSizes.sm),
      backgroundColor: dark ? TColors.darkerGrey : TColors.light,
      ),
      SizedBox(width: TSizes.spaceBtwItems),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
         EBrandTitleWithVerifiedIcon(title: 'Nike'),
    
      Flexible(child: EProductTitleText(title: 'Black Sport Shoes')),
    
      Text.rich(
        TextSpan(children: [
          TextSpan(text: 'Color', style: theme.bodySmall),
          TextSpan(text: 'Green', style: theme.bodyLarge),
          TextSpan(text: 'Size', style: theme.bodySmall),
          TextSpan(text: 'UK 08', style: theme.bodyLarge),
        ])
      )
      ],)
    ]);
  }
}