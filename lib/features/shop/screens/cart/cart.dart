import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop_ease/features/shop/screens/checkout/checkout.dart';
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
        child: ECartItems()
      ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: 8),
      child: ElevatedButton(onPressed: (){
        Get.to(()=> CheckoutScreen());
      }, child: Text('Checkout \$256.0')),
    ),
    );

  }
}

