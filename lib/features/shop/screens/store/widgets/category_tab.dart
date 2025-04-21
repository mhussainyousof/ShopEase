import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/brands/brand_showcase.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_vertical.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ECategoryTab extends StatelessWidget {
  const ECategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(padding:
        EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          EBrandShowCase(
            images: [
              TImages.productImage1,TImages.productImage2,TImages.productImage3
            ],
          ),
          EBrandShowCase(
            images: [
              TImages.productImage1,TImages.productImage2,TImages.productImage3
            ],
          ),
          RowTextButton(title: 'You mignt like', showActionButton: true, onPressed: (){},),
          SizedBox(height: TSizes.spaceBtwItems,),
          EGridLayout(itemCount: 4, itemBuilder: (_,index)=>EProductCardVertical(productModel: ProductModel.empty()))
        ],), 
        ),
      ],
    );
  }
}