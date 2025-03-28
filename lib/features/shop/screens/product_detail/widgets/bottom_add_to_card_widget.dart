import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/icons/circular_icon.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EBottomAddToCardWidget extends StatelessWidget {
  const EBottomAddToCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Row(
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
              ),
              SizedBox(width: TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: TSizes.spaceBtwItems),
              ECircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 30,
                height: 30,
                size: 20,
                color: TColors.white,
              )
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
          
              padding: EdgeInsets.all(4),
              backgroundColor: TColors.black,
              side: BorderSide(color: TColors.black),
              
              
            ),
            
            onPressed: (){}, child: Text('Add To Cart', style: TextStyle(fontSize: 12)))
        ],
      ),
    );
  }
}
