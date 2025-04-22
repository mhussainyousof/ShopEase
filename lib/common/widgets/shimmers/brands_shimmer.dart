import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/shimmers/shimmer.dart';

class EBrandsShimmer extends StatelessWidget {
  const EBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return EGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const EShimmerEffect(width: 300, height: 80),
    );
  }
}
