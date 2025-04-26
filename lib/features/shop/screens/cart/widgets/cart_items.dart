import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/products/cart/add_remove_button.dart';
import 'package:shop_ease/common/widgets/products/cart/cart_item.dart';
import 'package:shop_ease/common/widgets/texts/product_price_text.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({super.key,  this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx((){
      return ListView.separated(
      shrinkWrap: true,
      itemCount: cartController.cartItems.length,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => 
      Obx((){
        final item = cartController.cartItems[index];
        return Column(

        children: [


          ECartItem(cartItem: item),
         if(showAddRemoveButtons)  SizedBox(height: TSizes.spaceBtwItems),
         if(showAddRemoveButtons) Row( 


            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),


                  EProductQuantityWithAddAndRemoveButton(
                    quantity: item.quantity,
                    add: ()=> cartController.addOneToCart(item),
                    remove: ()=> cartController.removeOneFromCart(item),

                  ),
                ],
              ),
              EProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
            ],
          )
        ],
      );
      })
      
    );
    });
  }
}
