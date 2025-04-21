import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/white_circle.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/shimmers/shimmer.dart';
import 'package:shop_ease/features/shop/controllers/banners_controller.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = HomeController.instance;
    final controller = Get.put(BannerController());
    return Obx((){
      if(controller.isLoading.value)return EShimmerEffect(width: double.infinity, height: 190);
      if(controller.banners.isEmpty){
        return Center(child: Text('No Data Found!'));
      }else{
        return Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index),
                    viewportFraction: 1),
                items: controller.banners
                    .map((banner) => ERoundedImage(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  onTap: () => Get.toNamed(banner.targetScreen),
                ))
                    .toList()),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                    margin: EdgeInsets.only(right: 10),
                  ),
              ],
            ))
          ],
        );
      }

    });
  }
}
