import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/features/shop/models/cart_item_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    required this.cartItem,
    super.key,

  });

  final CartItemModel cartItem;



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
      ERoundedImage(imageUrl: cartItem.image  ?? '',
      width: 60,
      isNetworkImage: true,
      height: 60,
      padding: EdgeInsets.all(TSizes.sm),
      backgroundColor: dark ? TColors.darkerGrey : TColors.light,
      ),


      SizedBox(width: TSizes.spaceBtwItems),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
         EBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
    
      Flexible(child: EProductTitleText(title:cartItem.title)),
    
     /// ALLPLUDUES
Text.rich(
  TextSpan(
    children: [
      ...(cartItem.selectedVariation ?? {}).entries.map(
        (e) => TextSpan(
          children: [
            TextSpan(
              text: '${e.key}: ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: e.value,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ), // TextSpan
      ),
    ],
  ), // TextSpan
), // Text.rich
      ],)
    ]);
  }
}