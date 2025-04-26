import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/appbar/tabbar.dart';
import 'package:shop_ease/common/widgets/brands/brand_cart.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/cart/bag_count.dart';
import 'package:shop_ease/common/widgets/shimmers/brands_shimmer.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/controllers/brand_controller.dart';
import 'package:shop_ease/features/shop/controllers/categories_controller.dart';
import 'package:shop_ease/features/shop/screens/brands/all_brands.dart';
import 'package:shop_ease/features/shop/screens/brands/brand_product.dart';
import 'package:shop_ease/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: categories.length, // Define the number of tabs
      child: Scaffold(
        // Custom app bar with a title and cart button
        appBar: MyAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            BagCountWidget(
              
            )
          ],
        ),

        // NestedScrollView to handle coordinated scrolling between header and content
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,

                // Flexible space for search bar and featured brands section
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
                        onPressed: () => Get.to(() => AllBrandsScreen()),
                        showActionButton: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // Grid layout for featured brand logos
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const EBrandsShimmer();
                        }

                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }

                        return EGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return EBrandCard(
                                onTap: () =>
                                    Get.to(() => BrandProducts(brand: brand)),
                                showBorder: true,
                                brandModel: brand);
                          },
                        );
                      })
                    ],
                  ),
                ),

                // Tab bar with categories
                bottom: ETabbar(
                  tabs: categories.map((category)=>Tab(child: Text(category.name))).toList()
                ),
              )
            ];
          },

          // Content of each tab
          /// -- Body -- Tutorial [Section # 3, Video # 8]
          body: TabBarView(
            children: categories
                .map((category) => TCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
