import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/features/shop/screens/cart/cart.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

//! Shopping bag icon with an item count badge.
class BagCountWidget extends StatelessWidget {
  const 
  BagCountWidget({
    this.iconColor,
    super.key,
  });

  final Color? iconColor; //! Color of the shopping bag icon

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
  final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        //! Shopping bag icon button
        IconButton(
          onPressed: ()=> Get.to(()=>CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),

        //! Positioned item count badge
        Positioned(
          right: 5,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: dark ? TColors.light : TColors.dark, 
              shape: BoxShape.circle,
            ),
            child: Center(
              child:Obx((){
               return  Text(
                controller.noOfCartItems.value.toString(),
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: dark ? TColors.dark : TColors.light, 
                      fontSizeFactor: 0.8,
                    ),
              );
              })
            ),
          ),
        ),
      ],
    );
  }
}





