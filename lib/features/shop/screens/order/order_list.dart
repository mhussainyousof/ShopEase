import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EOrderListItems extends StatelessWidget{
  const EOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
   return ListView.separated(
    itemCount: 4,
      separatorBuilder: (_, index)=>SizedBox(height: TSizes.spaceBtwItems) ,
     itemBuilder:(_, index)=> ERoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Iconsax.ship),
              SizedBox(width: TSizes.spaceBtwItems/2),
     
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Processing',
                    style: theme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                    
                    
                    ),
                    Text('09, Dec, 2025', style: theme.headlineSmall)
                ]),
              ),
              IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm))
            ]
          ),
            SizedBox(height: TSizes.spaceBtwItems),
           Row(
             children: [
               Expanded(
                 child: Row(
                  children: [
                    Icon(Iconsax.ship),
                    SizedBox(width: TSizes.spaceBtwItems/2),
                 
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order',
                          style: theme.labelMedium),
                 
                          Text('#34f4', style: theme.titleMedium)
                      ]),
                    ),
                  ]
                         ),
               ),
               Expanded(
                 child: Row(
                  children: [
                    Icon(Iconsax.calendar),
                    SizedBox(width: TSizes.spaceBtwItems/2),
                 
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipping Date',
                          style: theme.labelMedium),
                 
                          Text('04, Oct, 2025', style: theme.titleMedium)
                      ]),
                    ),
                  ]
                         ),
               ),
             ],
           ),
     
        ],
      ),
     ),
   );
  }

}