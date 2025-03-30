import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/brands/brand_cart.dart';
import 'package:shop_ease/common/widgets/sortable/sortable_products.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class BrandProduct extends StatelessWidget{
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: MyAppBar(title: Text('Nike'),
    
    ),
    body:SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      
      child: Column(
        children: [
          EBrandCard(showBorder: true),
          SizedBox(height: TSizes.spaceBtwSections),
          ESortableProducts()
        ],
      ),
      ),
    ) ,
   );
  }
}