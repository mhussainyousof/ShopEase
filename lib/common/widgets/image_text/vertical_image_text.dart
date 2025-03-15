import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class VerticalTextImage extends StatelessWidget {
  const VerticalTextImage({
    super.key, required this.image, required this.title,  this.textColor = TColors.white, this.backgroundColor, this.onTap,
  });

  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(TSizes.sm),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(100),
                  color: backgroundColor ?? (dark ? TColors.black : TColors.white),
                ),
                child: Center(
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      color: dark ? TColors.light : TColors.dark,
                    ))),
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
