import 'package:flutter/material.dart';
import 'package:shop_ease/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:shop_ease/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [    
                  EProductImageSlider(),

                  Padding(padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
                  
                  child: Column(
                    children: [
                      ERatingAndShare()
                    ],
                  ),
                  )
          ],
        ),
      ),
    );
  }
}

