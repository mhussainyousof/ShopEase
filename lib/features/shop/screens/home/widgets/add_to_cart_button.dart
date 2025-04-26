import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/shop/controllers/product/cart_controller.dart';
import 'package:shop_ease/features/shop/controllers/product/product_controller.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/features/shop/screens/product_detail/product_detail.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: (){
        // If the product has variations then show the product details for Variation Selection.
// Else add the product to the cart.
if (product.productType == ProductType.single.toString()) {
  final cartItem = cartController.convertToCartItem(product, 1);
  cartController.addOneToCart(cartItem);
} else {
  Get.to(()=> ProductDetailScreen(productModel: product));
}
      },
      child: Obx((){

        final producQuantityInCart = cartController.getProductQuantityInCart(product.id);

        return Container(
        decoration: BoxDecoration(

          color:  producQuantityInCart > 0 ? TColors.primary  : TColors.dark,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomRight:
                  Radius.circular(TSizes.productImageRadius)),
        ),
        child: SizedBox(
          width: TSizes.iconLg * 1.2,
          height: TSizes.iconLg * 1.2,
          child: Center(
            child: 
            producQuantityInCart > 0 ? Text(producQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),):
            Icon(
              Iconsax.add,
              color: TColors.white,
            ),
          ),
        ),
      );
      })
    );
  }
}
