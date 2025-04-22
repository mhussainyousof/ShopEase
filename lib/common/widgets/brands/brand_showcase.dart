import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/brands/brand_cart.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/features/shop/models/brand_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({
    required this.images,
    super.key,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),

      //! Column layout to display brand card and product images
      child: Column(
        children: [
          //! Brand card at the top
          EBrandCard(
            brandModel: BrandModel.empty(),
            showBorder: false),
          SizedBox(height: TSizes.spaceBtwItems),

          //! Row displaying brand's top products as images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  //! Widget to display individual product images inside rounded containers
  Widget brandTopProductImageWidget(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Expanded(
      child: ERoundedContainer(
        height: 100,
        padding: EdgeInsets.all(TSizes.md),
        margin: EdgeInsets.only(right: TSizes.sm),
        backgroundColor: dark ? TColors.darkGrey : TColors.light,
        child: Image(image: AssetImage(image)),
      ),
    );
  }
}
