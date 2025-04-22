import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/controllers/product/product_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/features/shop/screens/product_detail/widgets/bottom_add_to_card_widget.dart';
import 'package:shop_ease/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:shop_ease/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:shop_ease/features/shop/screens/product_detail/widgets/products_attribute.dart';
import 'package:shop_ease/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:shop_ease/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: EBottomAddToCardWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EProductImageSlider(productModel: productModel),
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ERatingAndShare(),
                  ProductMetaData(productModel: productModel),
                 if(productModel.productType == ProductType.variable.toString()) EProductsAttribute(productModel: productModel),
                if(productModel.productType == ProductType.variable.toString())  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Checkout')),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  RowTextButton(title: 'Description'),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    productModel.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show More',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowTextButton(title: 'Reviews (199)'),
                      IconButton(
                          onPressed: () {
                            Get.to(() => ProductReviewsScreen());
                          },
                          icon: Icon(
                            Iconsax.arrow_right_3,
                            size: 20,
                            color: TColors.white,
                          ))
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
