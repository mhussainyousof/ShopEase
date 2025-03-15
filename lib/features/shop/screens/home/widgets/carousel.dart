import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/white_circle.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/features/shop/controllers/home_controller.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.banners
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(
              onPageChanged: (index, _)=> controller.updatePageIndicator(index),
              viewportFraction: 1),
          items: banners.map((url)=> CarouselImage(imageUrl: url)).toList()
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(()=> Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i = 0; i<banners.length; i++)
              CircularContainer(
                width: 20,
                height: 4,
                backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                margin: EdgeInsets.only(right: 10),
              ),
          ],
        ))
      ],
    );
  }
}