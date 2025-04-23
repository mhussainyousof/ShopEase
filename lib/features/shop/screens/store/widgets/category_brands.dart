import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/brands/brand_showcase.dart';
import 'package:shop_ease/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:shop_ease/common/widgets/shimmers/list_tile.shimmer.dart';
import 'package:shop_ease/features/shop/controllers/brand_controller.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // Handle Loader, No Record, OR Error Message
        const loader = Column(
          children: [
            EListTileShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
            EBoxesShimmer(),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        );

        final widget = TCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          loader: loader,
        );
        if (widget != null) return widget;

        // Record Found!
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];

            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                // Handle Loader, No Record, OR Error Message
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                );
                if (widget != null) return widget;

                // Record Found!
                final products = snapshot.data!;

                return EBrandShowCase(
                  brand: brand,
                  images: products.map((e) => e.thumbnail).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}

