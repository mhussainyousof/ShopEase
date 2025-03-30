import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_vertical.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ].map((e) => DropdownMenuItem(
              value: e,
              child: Text(e))).toList(),
            onChanged: (value) {},
            ),
    
            SizedBox(height: TSizes.spaceBtwSections),
            EGridLayout(itemCount: 2, itemBuilder: (_, index)=>EProductCardVertical())
      ],
    );
  }
}
