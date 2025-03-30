import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/brands/brand_cart.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/sortable/sortable_products.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/screens/brands/brand_product.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              RowTextButton(title: 'Brands'),
              SizedBox(height: TSizes.spaceBtwItems),

              EGridLayout(
                
                mainAxisExtent: 80,
                itemCount: 5, itemBuilder: (context, index)=>
                 EBrandCard( 
                  onTap: ()=> Get.to(()=> BrandProduct()),
                  showBorder: true)
              )
            ],
          ),
        ),
      ),
    );
  }
}
