import 'package:flutter/cupertino.dart';
import 'package:shop_ease/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

import 'shimmer.dart';

class ECategoryShimmer extends StatelessWidget {

  final int itemCount;

  const ECategoryShimmer({
    super.key, this.itemCount = 6
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
          itemCount: itemCount,

          itemBuilder: (_, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                EShimmerEffect(width: 55, height: 8),
              ]);
          },

      ),
    );
  }
}