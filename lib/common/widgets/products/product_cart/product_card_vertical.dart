import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/styles/shadows.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EProductCardVertical extends StatelessWidget{
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(width: 180,
    padding: EdgeInsets.all(1),
    decoration: BoxDecoration(
      boxShadow: [EShadowStyle.verticalProductShadow],
      borderRadius: BorderRadius.circular(TSizes.productImageRadius),
      color: dark ? TColors.darkGrey : TColors.white
    ),
    child: Column(children: [
      ERoundedContainer(height: 180, padding: EdgeInsets.all(TSizes.sm),
      backgroundColor: dark ? TColors.dark : TColors.light,
      child: Stack(
        children: [
          ERoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true),
          Positioned(
            top: 10,
            child: ERoundedContainer(
              radius:TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black,)),
            ),
          ),
        
         Positioned(
          top: 0,
          right: 0,
          child: ECircularIcon(icon: Iconsax.heart5, color: Colors.red,))
        ],
      ),
      ),

      Padding(padding: EdgeInsets.only(left: TSizes.sm),
      child: Column(
        children: [
         EProductTitleText(title: 'Green Nike Air Shoes', smallSize: true,)
        ],
      ),
      
      )
    ],),
    );
  }
}


