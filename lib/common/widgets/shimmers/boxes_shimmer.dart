import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/shimmers/shimmer.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class EBoxesShimmer extends StatelessWidget {
  const EBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: EShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: EShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: EShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
