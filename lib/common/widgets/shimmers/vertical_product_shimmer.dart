import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/shimmers/shimmer.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class EVerticalProductShimmer extends StatelessWidget {
  const EVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///! Image
            EShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems),

            ///! Text
            EShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            EShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
