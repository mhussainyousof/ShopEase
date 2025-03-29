import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/products/cart/add_remove_button.dart';
import 'package:shop_ease/common/widgets/products/cart/cart_item.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({super.key,  this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, __) => Column(
        children: [
          ECartItem(),
         if(showAddRemoveButtons)  SizedBox(height: TSizes.spaceBtwItems),
         if(showAddRemoveButtons) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),
                  EProductQuantityWithAddAndRemoveButton(),
                ],
              ),
              EProductPriceText(price: '435')
            ],
          )
        ],
      ),
    );
  }
}
