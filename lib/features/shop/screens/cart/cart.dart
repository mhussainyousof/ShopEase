import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/products/cart/add_remove_button.dart';
import 'package:shop_ease/common/widgets/products/cart/cart_item.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';

import 'package:shop_ease/utils/constants/sizes.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Cart', style: theme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (_, __) =>
              SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder: (_, __) => Column(
            children: [
              ECartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
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
        ),
      ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: ElevatedButton(onPressed: (){}, child: Text('Checkout \$256.0')),
    ),
    );

  }
}

