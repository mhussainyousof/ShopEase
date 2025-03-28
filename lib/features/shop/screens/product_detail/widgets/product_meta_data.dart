import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/images/circular_image.dart';
import 'package:shop_ease/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ERoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm - 2, vertical: TSizes.xs - 2),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black, fontSizeFactor: 0.9)),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            EProductPriceText(price: '175', isLarge: true),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        EProductTitleText(title: 'Green Nike Sports Shirt'),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            EProductTitleText(title: 'Status'),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            ECircularImage(image: TImages.cosmeticsIcon,
          width: 32,
          height: 32,
          overlayColor: dark ? TColors.white : TColors.black,
            ),
            EBrandTitleWithVerifiedIcon(title: 'Nike', maxLines: 1),
          ],
        )
      ],
    );
  }
}
