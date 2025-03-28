import 'package:flutter/material.dart';
import 'package:shop_ease/features/shop/screens/product_reviews/widgets/progress_rating_indicator.dart';

class EOverAllProductRating extends StatelessWidget {
  const EOverAllProductRating({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
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
    );
  }
}

