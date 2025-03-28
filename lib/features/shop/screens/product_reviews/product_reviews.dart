import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/features/shop/screens/product_reviews/widgets/progress_rating_indicator.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/device/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text("Reviews & Rating"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Ratings and Reviews are verified and are from people who use the same type of device that you use.'),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        '4.8',
                        style: theme.displayLarge!.apply(fontSizeFactor: 0.65),
                      )),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        TRatingProgressIndicator(text: "5",value: 1),
                        TRatingProgressIndicator(text: "4",value: 0.8),
                        TRatingProgressIndicator(text: "3",value: 0.6),
                        TRatingProgressIndicator(text: "2",value: 0.4),
                        TRatingProgressIndicator(text: "1",value: 0.2),
                        
                        ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

