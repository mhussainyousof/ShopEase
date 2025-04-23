import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/shimmers/shimmer.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class EListTileShimmer extends StatelessWidget {
  const EListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            EShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              children: [
                EShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                EShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
