import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/images/circular_image.dart';
import 'package:shop_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shop_ease/features/shop/models/brand_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/enums.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EBrandCard extends StatelessWidget {
  const EBrandCard({
    required this.brandModel,
    super.key, required this.showBorder, this.onTap,
  });

    final BrandModel brandModel;
    final bool showBorder;
    final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
    onTap: onTap,
    child: ERoundedContainer(
      padding: EdgeInsets.all(TSizes.sm),

      showBorder: showBorder,
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: ECircularImage(
                isNetworkImages: true,
                image: brandModel.image,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            SizedBox(height : TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EBrandTitleWithVerifiedIcon(
                title: brandModel.name,
                brandTextSize: TextSizes.large,
              ),
                Text(' ${brandModel.productsCount ?? 0} Products',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
                )
                ],
              ),
            )
          ],
        ),
      ),
    ),
                        );
  }
}