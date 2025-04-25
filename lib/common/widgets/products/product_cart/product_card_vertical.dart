import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/styles/shadows.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:shop_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/features/shop/controllers/product/product_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/features/shop/screens/product_detail/product_detail.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
        productModel.price, productModel.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            productModel: productModel,
          )),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [EShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
         
          children: [
            //! 🖼️ Product Image Section (Includes Image, Discount Badge & Favorite Icon)
            ERoundedContainer(
              height: 160,
              width: 180,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  Center(
                    child: ERoundedImage(
                      isNetworkImage: true,
                      imageUrl: productModel.thumbnail,
                      applyImageRadius: true,
                    ),
                  ),
        
                  //! sale tag
                  if(salePercentage != null)
                  Positioned(
                    top: 10,
                    left: 5,
                    child: ERoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('$salePercentage%',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: TColors.black,
                              )),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: EFavoriteIcon(productId: productModel.id)
                  ),
                ],
              ),
            ),
        
            SizedBox(height: TSizes.spaceBtwItems / 2),
        
            //! 📃 Product Info Section (Title, Brand, Verification Badge)
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EProductTitleText(
                    alignment: Alignment.centerLeft,
                    title: productModel.title,
                    smallSize: true,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2), // 📏 Spacing
              
                  //! 🏢 Brand Name with Verification Badge
                  EBrandTitleWithVerifiedIcon(
                    textAlign: TextAlign.left,
                    title: productModel.brand!.name,
                  ),
                ],
              ),
            ),
            Spacer(),
        
            //!💰 Price & Add to Cart Button Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (productModel.productType ==
                              ProductType.single.toString() &&
                          productModel.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            productModel.price.toString(),
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        ), 
        
                      /// Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: EProductPriceText(
                            price: controller.getProductPrice(productModel)),
                      ), 
                    ],
                  ),
                ), 
        
                Container(
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(TSizes.productImageRadius)),
                  ),
                  child: SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
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
    );
  }
}
