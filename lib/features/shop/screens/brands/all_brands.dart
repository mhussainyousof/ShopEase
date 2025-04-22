import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/brands/brand_cart.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/shimmers/brands_shimmer.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/controllers/brand_controller.dart';
import 'package:shop_ease/features/shop/screens/brands/brand_product.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: MyAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              RowTextButton(title: 'Brands'),
              SizedBox(height: TSizes.spaceBtwItems),

              Obx(() {
                        if (brandController.isLoading.value)
                         {return const EBrandsShimmer();} 

                        if (brandController.allBrands.isEmpty) {
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
                          itemCount: brandController.allBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.allBrands[index];
                            return EBrandCard(
                                showBorder: true, brandModel: brand,
                                onTap: ()=> Get.to(()=> BrandProducts(brand:brand)),
                                );
                          },
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
