import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/custom_shapes/curved_edges/main_curve.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/features/shop/controllers/product/images_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    required this.productModel,
    super.key,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(productModel);
    final dark = THelperFunctions.isDarkMode(context);

    return CurvedEdgeWidget(
        child: Container(
      color: dark ? TColors.darkerGrey : TColors.light,
      child: Stack(
        children: [
          SizedBox(
            height: 320,
            child: Padding( 
              padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(child: 
              
            
              Image(image: AssetImage(TImages.productImage5))
              
              ),
            )),
         Positioned(
          right: 0,
          bottom: 30,
          left: TSizes.defaultSpace,
           child: SizedBox(
            height: 70,
             child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (_,index){
              return  ERoundedImage(
                width: 70,
                backgroundColor: dark ? TColors.dark : TColors.white,
                border: Border.all(color: TColors.primary),
                padding: EdgeInsets.all(TSizes.sm),
                imageUrl: TImages.productImage3);
             }, separatorBuilder: (_,__){
                                   return  SizedBox(width: TSizes.spaceBtwItems);
             }, itemCount: 6),
           ),
         ),
    
         MyAppBar(
          showBackArrow: true,
          actions: [
            ECircularIcon(icon: Iconsax.heart5, color: Colors.red,)
          ],
         )
            
        ],
      ),
    ));
  }
}
