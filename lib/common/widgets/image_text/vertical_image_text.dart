import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/images/circular_image.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class VerticalTextImage extends StatelessWidget {
  const VerticalTextImage({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = false
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            ECircularImage(
              width: 50,
            height: 50,
            image: image,
            fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.1,
              isNetworkImages: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark
            ),
            SizedBox(
              height: TSizes.defaultSpace / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
