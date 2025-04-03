import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/features/shop/screens/order/order_list.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget{
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('My Orders', style: theme.headlineSmall)
      ),
      body: Padding(padding: 
      EdgeInsets.all(TSizes.defaultSpace),
      child: EOrderListItems(),
      ),
    );
  }
  
}