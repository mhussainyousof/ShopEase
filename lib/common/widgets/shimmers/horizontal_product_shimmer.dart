import 'package:flutter/cupertino.dart';
import 'package:shop_ease/common/widgets/shimmers/shimmer.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class EHorizontalProductShimmer extends StatelessWidget {
  const EHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
        const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            EShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems / 2),
                EShimmerEffect(width: 160, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                EShimmerEffect(width: 110, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                EShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
