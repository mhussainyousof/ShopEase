import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class EBillingsPaymentSection extends StatelessWidget{
  const EBillingsPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = THelperFunctions.isDarkMode(context);
   return Column(
    children: [
      RowTextButton(title: 'Payment Method', buttonTitle: 'Change', showActionButton: true),
      SizedBox(height: TSizes.spaceBtwItems/2),
      Row(children: [
        ERoundedContainer(
          width: 60,
          height: 35,
          backgroundColor: dark ? TColors.light : TColors.white,
          padding: EdgeInsets.all(TSizes.sm),
          child: Image(image: AssetImage(TImages.paypal), fit: BoxFit.contain),

        ),
        SizedBox(
          width: TSizes.spaceBtwItems / 2,
        ),
        Text('Paypal', style: theme.bodyLarge)
      ],)
    ],
   );
  }

}