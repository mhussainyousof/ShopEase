import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/demo_curved_widget.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shop_ease/common/widgets/products/cart/bag_count.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'widgets/home_categories.dart';

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
              child: Column(children: [
                // Custom AppBar with title, subtitle, and action button (bag icon)
                MyAppBar(
                  title: Column(
                    children: [
                      Text(
                        TTexts.homeAppbarTitle,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: Colors.white.withAlpha(200)),
                      ),
                      Text(
                        TTexts.homeAppbarSubTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
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
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SearchContainer(text: 'Search here...'),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      RowTextButton(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      HomeCategories()
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}



