import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/appbar/appbar.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/common/widgets/layout/grid_layout.dart';
import 'package:shop_ease/common/widgets/products/product_cart/product_card_vertical.dart';
import 'package:shop_ease/features/shop/screens/home/home.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget{
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: MyAppBar(
      title: Text('WishList', style: Theme.of(context).textTheme.headlineMedium,),
      actions: [
        ECircularIcon(icon: Iconsax.add, onPressed:()=> Get.to(()=> HomeScreen()),)
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          EGridLayout(itemCount: 6, itemBuilder: (_,index)=>EProductCardVertical( ))
        ],
      ),
      ),
    ),
   );
  }

}