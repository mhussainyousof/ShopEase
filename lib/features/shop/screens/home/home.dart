import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/demo_curved_widget.dart';
import 'package:shop_ease/common/widgets/products/cart/bag_count.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/device/device_utility.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main scrollable content of the Home Screen
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with curved background and custom app bar
            DemoCurveWidget(
              child: Column(
                children: [
                  // Custom AppBar with title, subtitle, and action button (bag icon)
                  MyAppBar(
                    title: Column(
                      children: [
                        Text(
                          TTexts.homeAppbarTitle,
                          style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white.withAlpha(200)),
                        ),
                        Text(
                          TTexts.homeAppbarSubTitle,
                          style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
                        )
                      ],
                    ),
                    actions: [
                      // Shopping bag icon with item count
                      BagCountWidget(
                        iconColor: TColors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections ,),
                  SearchContainer(
                    showBorder: false,
                    text: 'Search here...',
                    

                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, this.icon = Iconsax.search_normal,  required this.text,  this.showBackground = true,  this.showBorder = true,
  });

  final IconData? icon;
  final String text;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace - 2),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(TSizes.sm + 5),
        decoration: BoxDecoration(
          color: showBackground ? dark ? TColors.dark : TColors.light : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null
      
          
        ),
        child: Row(
          children: [
            Icon(icon, color: TColors.darkGrey,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text(text, style:Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
