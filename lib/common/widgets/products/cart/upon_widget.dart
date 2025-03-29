import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class ECouponCode extends StatelessWidget {
  const ECouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
    return ERoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(children: [
        Expanded (
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your promo code!',
              hintStyle: TextStyle(fontSize: 12),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              fillColor: dark ? TColors.dark: TColors.white
              
            ),
          ),
    
        ),
    
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
            backgroundColor: Colors.grey.withOpacity(0.1),
            padding: EdgeInsets.all(0),
            side: BorderSide.none
    
          ),
          onPressed: (){}, child: Text('Apply', style: theme.titleSmall,))
      ],),
      
    );
  }
}