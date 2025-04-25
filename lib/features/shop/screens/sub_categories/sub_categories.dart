import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_horizantle.dart';
import 'package:shop_ease/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/controllers/categories_controller.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';
import 'package:shop_ease/features/shop/screens/all_products/all_products.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/cloud_helper_functions.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: Text(categoryModel.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ERoundedImage(
                  imageUrl: TImages.promoBanner3,
                  applyImageRadius: true,
                  width: double.infinity),
              SizedBox(height: TSizes.spaceBtwSections),

              // Sub-Categories section
              FutureBuilder(
                future: controller.getSubCategories(categoryModel.id),
                builder: (context, snapshot) {
                  // Handle Loader, No Record, OR Error Message
                  const loader = EHorizontalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  // Record found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];

                      return FutureBuilder(
                        future: controller.getCategoryProducts(
                            categoryId: subCategory.id),
                        builder: (context, snapshot) {
                          // Handle Loader, No Record, OR Error Message
                          final widget =
                              TCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          // Record found
                          final products = snapshot.data!;

                          return Column(
                            children: [
                              // Heading
                              RowTextButton(
                                showActionButton: true,
                                title: subCategory.name,
                                onPressed: () => Get.to(
                                  () => AllProductsScreen(
                                    title: subCategory.name,
                                    futureMethod:
                                        controller.getCategoryProducts(
                                            categoryId: subCategory.id,
                                            limit: -1),
                                  ),
                                ), // AllProducts
                              ), // TSectionHeading
                              const SizedBox(height: TSizes.spaceBtwItems / 2),

                              SizedBox(
                                height: 120,
                                child: ListView.separated(

                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                          width: TSizes.spaceBtwItems),
                                  itemBuilder: (context, index) =>
                                      EProductCartHorizontal(

                                          product: products[index]),
                                ), // ListView.separated
                              ), // SizedBox
                              SizedBox(height: 20)
                            ],
                          ); // Column
                        },
                      ); // FutureBuilder
                    },
                  ); // ListView.builder
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
