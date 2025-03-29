import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/images/carousel_images.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_horizantle.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MyAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
        
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        
        child: Column(
          children: [
            ERoundedImage(imageUrl: TImages.promoBanner3, applyImageRadius: true, width: double.infinity),
            SizedBox(height: TSizes.spaceBtwSections),
            Column(
              children: [
                RowTextButton(title: 'Sports Shirts', showActionButton: true),
                SizedBox(height: TSizes.spaceBtwItems/2),

                SizedBox(
                  height: 120,
                  child: ListView.separated( 
                    separatorBuilder: (context, index)=> SizedBox(width: TSizes.spaceBtwItems),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context, index)=> EProductCartHorizontal()),
                ), 
                
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}