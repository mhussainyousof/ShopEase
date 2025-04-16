import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/demo_curved_widget.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_vertical.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/screens/all_products/all_products.dart';
import 'package:shop_ease/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'widgets/carousel.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! Main scrollable content of the Home Screen
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Top section with curved background and custom app bar
            DemoCurveWidget(
              child: Column(children: [
                //! Custom AppBar with title, subtitle, and action button (bag icon)
                HomeAppbar(),
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
                      HomeCategories(),
                       SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace - 4),
                child: CustomSlider(
                  banners: [
                    TImages.promoBanner1,
                    TImages.promoBanner2,
                    TImages.promoBanner3
                  ],
                )),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  RowTextButton(
                    title: 'Popular Products',
                    showActionButton: true,
                       onPressed: ()=> Get.to(()=> AllProductsScreen()),
                  ),
                  EGridLayout(
                    itemBuilder: (_, index) => EProductCardVertical(),
                    itemCount: 4,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

