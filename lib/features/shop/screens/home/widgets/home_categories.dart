import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/image_text/vertical_image_text.dart';
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
              image: TImages.shoeIcon,
              title: 'Shoes Category',
            );
          }),
    );
  }
}