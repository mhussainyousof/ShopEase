import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   return Scaffold(
    appBar: MyAppBar(
      showBackArrow: true,
      title: Text("Reviews & Rating"),

    ),
    body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text('Ratings and Reviews are verified and are from people who use the same type of device that you use.'),
          SizedBox(height: TSizes.spaceBtwItems),

          Row(children: [
            Text('4.8', style: theme.textTheme.displayLarge,),
            
          ],)

        ],
      ),
      ),
    ),
   );
  }
}