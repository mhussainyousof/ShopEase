import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/utils/constants/colors.dart';

class ERatingBarIndicator extends StatelessWidget {
  const ERatingBarIndicator({
    required this.rating,
    super.key,
  });
    final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: TColors.grey,
      
      itemBuilder: (_, __){
      
      return Icon(Iconsax.star1, color: TColors.primary);
    });
  }
}