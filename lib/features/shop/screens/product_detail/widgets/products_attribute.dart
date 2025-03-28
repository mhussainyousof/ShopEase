import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/chips/choice_chip.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/common/widgets/texts/product_title._text.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EProductsAttribute extends StatelessWidget {
  const EProductsAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final theme = Theme.of(context);
    return Column(
      children: [
        ERoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.darkGrey.withOpacity(0.6),
          child: Column(
            children: [
              Row(
                children: [
                  RowTextButton(title: "Variation", showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          EProductTitleText(title: 'Price: ', smallSize: true),
                           SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            '\$25',
                            style: theme.textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: TSizes.spaceBtwItems),
                          EProductPriceText(price: '20'),
                        ],
                      ),

                      Row(children: [
                        EProductTitleText(title: 'Stock : ', smallSize: true),
                        Text('In Stock', style: theme.textTheme.titleMedium),

                      ],)
                    ],
                  ),
                ],
              ),
              EProductTitleText(title: 'This is the Description of the product and it can go up to max 4 lines',
              smallSize: true,
              maxLines: 4,
              )
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowTextButton(title: 'Colors'),
            SizedBox(height: TSizes.spaceBtwItems / 2),
           Wrap(
            spacing: 7,
            children: [
               EChoiceChip(text: 'Green', selected: true, onSelected: (value){},),
            EChoiceChip(text: 'Blue', selected: false, onSelected: (value){},),
            EChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},)
            ],
           )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowTextButton(title: 'Size'),
            SizedBox(height: TSizes.spaceBtwItems / 2),
           Wrap(
            spacing: 7,
            children: [
               EChoiceChip(text: 'EU 34', selected: true, onSelected: (value){},),
            EChoiceChip(text: 'EU 36', selected: false, onSelected: (value){},),
            EChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},)
            ],
           )
          ],
        )
      ],
    );
  }
}
