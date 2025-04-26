import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/loaders/animation_loader.dart';
import 'package:shop_ease/features/shop/controllers/product/order_controller.dart';
import 'package:shop_ease/navigation_home.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/cloud_helper_functions.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EOrderListItems extends StatelessWidget{
  const EOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
     final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);



   return FutureBuilder(

    future: controller.fetchUserOrders(),
builder: (_, snapshot) {
    // Nothing Found Widget
    final emptyWidget = EAnimationLoaderWidget(
        text: 'Whoops! No Orders Yet!',
        animation: TImages.docerAnimation,
        showAction: true,
        actionText: 'Let\'s fill it',
        onActionPressed: () => Get.off(() => const NavigationHome()),
    );

    /// Helper Function: Handle Loader, No Record, OR ERROR Message
    final response = TCloudHelperFunctions.checkMultiRecordState(
        snapshot: snapshot, 
        nothingFound: emptyWidget
    );
    if (response != null) return response;

    /// Congratulations ⭐ Record found.
    final orders = snapshot.data!;

     
       return ListView.separated(
        itemCount: orders.length,
          separatorBuilder: (_, index)=>SizedBox(height: TSizes.spaceBtwItems) ,
         itemBuilder:(_, index){

          final order = orders[index];
          return ERoundedContainer(
          
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
                        Text(order.orderStatusText,
                        style: theme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                        
                        
                        ),
                        Text(order.formattedOrderDate, style: theme.headlineSmall)
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
                     
                              Text(order.id, style: theme.titleMedium)
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
                     
                              Text(order.formattedDeliveryDate, style: theme.titleMedium)
                          ]),
                        ),
                      ]
                             ),
                   ),
                 ],
               ),
         
            ],
          ),
         );
         }
       );
     }
   );
  }

}