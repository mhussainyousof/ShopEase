import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/image_text/vertical_image_text.dart';
import 'package:shop_ease/common/widgets/shimmers/category_shimmer.dart';
import 'package:shop_ease/features/shop/controllers/categories_controller.dart';
import 'package:shop_ease/features/shop/screens/sub_categories/sub_categories.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) return ECategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(
            child: Text('No Data Found!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.featuredCategories.length,
            itemBuilder: (_, index) {
                final category = controller.featuredCategories[index];
              return VerticalTextImage(
                isNetworkImage: true,
                onTap: () => Get.to(() => SubCategoriesScreen()),
                image: category.image,
                title: category.name,
              );
            }),
      );
    });
  }
}
