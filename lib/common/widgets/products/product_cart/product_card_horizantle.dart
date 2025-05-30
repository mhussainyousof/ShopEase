import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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

class EProductCartHorizontal extends StatelessWidget {
  const EProductCartHorizontal({super.key,
  required this.product
  });


  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
        product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: ()=> Get.to(()=> ProductDetailScreen(productModel: product)) ,
      child: Container(
        width: 325,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.softGrey),
        child: Row(
          children: [
            ERoundedContainer(
              height: 120,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ERoundedImage(
                      isNetworkImage: true,
                        imageUrl: product.thumbnail, applyImageRadius: true),
                  ),
                  if(salePercentage != null)
                  Positioned(
                      top: 8,
                      child: ERoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '$salePercentage%',
                          style: theme.labelLarge!.apply(color: TColors.black),
                        ),
                      )),
                  Positioned(top: 0, right: 0, child: EFavoriteIcon(productId: product.id))
                ],
              ),
            ),
            SizedBox(width: TSizes.md),
            SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EProductTitleText(
                            title: product.title,
                            smallSize: true),
                        SizedBox(height: TSizes.spaceBtwItems / 2),
                        EBrandTitleWithVerifiedIcon(title: product.brand!.name)
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              if (product.productType ==
                                  ProductType.single.toString() &&
                                  product.salePrice > 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: TSizes.sm),
                                  child: Text(
                                    product.price.toString(),
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
                                    price: controller.getProductPrice(product)),
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
            )
          ],
        ),
      ),
    );
  }
}
