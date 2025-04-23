import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/brands/brand_showcase.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_vertical.dart';
import 'package:shop_ease/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/controllers/categories_controller.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/features/shop/screens/all_products/all_products.dart';
import 'package:shop_ease/features/shop/screens/store/widgets/category_brands.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/cloud_helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
 final controller = CategoryController.instance;
return ListView(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  children: [
    Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          /// -- Brands
          CategoryBrands(category: category),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// -- Products
          FutureBuilder(
            future: controller.getCategoryProducts(categoryId: category.id),
            builder: (context, snapshot) {
              // Helper Function: Handle Loader, No Record, OR ERROR Message
              final response = TCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot,
                loader: const EVerticalProductShimmer(),
              );
              if (response != null) return response;

              // Record Found!
              final products = snapshot.data!;

              return Column(
                children: [
                  RowTextButton(
                    title: 'You might like',
                    onPressed: () => Get.to(
                      AllProductsScreen(
                        title: category.name,
                        futureMethod: controller.getCategoryProducts(
                          categoryId: category.id,
                          limit: -1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  EGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        EProductCardVertical(productModel: products[index]),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ),
  ],
);
  }}