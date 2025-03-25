import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ECircularIcon extends StatelessWidget {
  const ECircularIcon({
    super.key,
    required this.icon,  
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? (dark ?
            
            TColors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9)),
      ),
      child: SizedBox(
        width: 40,
        height: 40,
        child: IconButton(onPressed: onPressed , icon: Icon(icon, color: color, size: size,))),
    );
  }
}
