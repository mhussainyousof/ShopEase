import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ECircularImage extends StatelessWidget {
  const ECircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImages = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 65,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImages;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??(dark ? TColors.black : TColors.white),

        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
        
          child: isNetworkImages ?
             CachedNetworkImage(
                 fit: fit,
                 color: overlayColor,
                 progressIndicatorBuilder: (context, url, downloadProgress)=>EShimmerEffect(width: 55, height: 55, radius: 55,),
                 errorWidget: (context, url, error)=>Icon(Icons.error),
                 imageUrl: image) :
        
          Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
