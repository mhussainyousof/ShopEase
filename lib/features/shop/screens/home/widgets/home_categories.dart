import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/image_text/vertical_image_text.dart';
import 'package:shop_ease/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (_, index) {
            return VerticalTextImage(
              onTap:() => Get.to(()=> SubCategoriesScreen()),
              image: TImages.shoeIcon,
              title: 'Shoes Category',
            );
          }),
    );
  }
}