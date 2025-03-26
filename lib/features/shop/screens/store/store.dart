import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/appbar/tabbar.dart';
import 'package:shop_ease/common/widgets/brands/brand_cart.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/cart/bag_count.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the app is in dark mode
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 4, // Define the number of tabs
      child: Scaffold(
        // Custom app bar with a title and cart button
        appBar: MyAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            BagCountWidget(
              onPressed: () {},
            )
          ],
        ),

        // NestedScrollView to handle coordinated scrolling between header and content
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true, // Keeps the app bar visible when scrolling
                floating: true, // Allows it to appear/disappear while scrolling
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440, // Height of the expandable header

                // Flexible space for search bar and featured brands section
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // Prevents scrolling inside this ListView
                    children: [
                      // Search bar
                      SearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),

                      // Featured brands section
                      RowTextButton(
                        title: 'Featured Brands',
                        onPressed: () {},
                        showActionButton: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // Grid layout for featured brand logos
                      EGridLayout(
                        mainAxisExtent: 80,
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return EBrandCard(showBorder: true);
                        },
                      )
                    ],
                  ),
                ),

                // Tab bar with categories
                bottom: ETabbar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              )
            ];
          },

          // Content of each tab
          body: TabBarView(
            children: [
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
              ECategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
