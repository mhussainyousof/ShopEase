import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/products/rating/rating_indicator.dart';
import 'package:shop_ease/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:shop_ease/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and Reviews are verified and are from people who use the same type of device that you use.'),
              SizedBox(height: TSizes.spaceBtwItems),
              EOverAllProductRating(),
              ERatingBarIndicator(rating: 3.5),
              Text('12,611', style: theme.bodySmall),
              SizedBox(height: TSizes.spaceBtwSections),
              UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}
