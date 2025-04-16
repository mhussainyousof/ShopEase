import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;

  const EShimmerEffect(
      {super.key,
        required this.width,
        required this.height,
        this.radius = 15,
        this.color});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color ?? (dark ? TColors.darkerGrey : TColors.white),

          ),
        ));
  }
}