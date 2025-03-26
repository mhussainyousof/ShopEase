import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/styles/shadows.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context); 

    return GestureDetector(
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow], 
          borderRadius: BorderRadius.circular(TSizes.productImageRadius), 
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            //! 🖼️ Product Image Section (Includes Image, Discount Badge & Favorite Icon)
            ERoundedContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ERoundedImage(
                    imageUrl: TImages.productImage1, 
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 10,
                    child: ERoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: TColors.black,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ECircularIcon(
                      icon: Iconsax.heart5, 
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: TSizes.spaceBtwItems / 2),

            //! 📃 Product Info Section (Title, Brand, Verification Badge)
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EProductTitleText(
                    title: 'Green Nike Air Shoes', // 👟 Product Title
                    smallSize: true,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2), // 📏 Spacing
                  
                  // 🏢 Brand Name with Verification Badge
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Nike', // 🏷️ Brand Name
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      SizedBox(width: TSizes.xs),
                      Icon(
                        Iconsax.verify5, // ✅ Verified Brand Icon
                        color: TColors.primary,
                        size: TSizes.iconXs,
                      )
                    ],
                  ),
                  
                  // 💰 Price & Add to Cart Button Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EProductPriceText(
                        price: '35.0', // 💲 Price Tag
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius)),
                        ),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add, // ➕ Add to Cart Icon
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
