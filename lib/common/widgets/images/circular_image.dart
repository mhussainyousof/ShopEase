import 'package:flutter/material.dart';
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
      child: Image(
        fit: fit,
        
        image: isNetworkImages ? NetworkImage(image) : AssetImage(image) as ImageProvider,

        color: overlayColor,
      ),
    );
  }
}
