import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EBottomAddToCardWidget extends StatelessWidget {
  const EBottomAddToCardWidget({
   
    super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Obx(()=>Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
             Row(
            children: [
              ECircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 30,
                height: 30,
                size: 20,
                color: TColors.white,
                onPressed: ()=>controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -= 1,
              ),
              SizedBox(width: TSizes.spaceBtwItems),
              Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: TSizes.spaceBtwItems),
              ECircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 30,
                height: 30,
                size: 20,
                color: TColors.white,
                onPressed: ()=> controller.productQuantityInCart.value += 1,
              )
            ],
          ),
         
          ElevatedButton(
            style: ElevatedButton.styleFrom(
          
              padding: EdgeInsets.all(4),
              backgroundColor: TColors.black,
              side: BorderSide(color: TColors.black),
              
              
            ),
            
            onPressed: controller.productQuantityInCart.value < 1 ? null : ()=> controller.addToCart(product), child: Text('Add To Cart', style: TextStyle(fontSize: 12)))
        ],
      ),)
    );
  }
}
