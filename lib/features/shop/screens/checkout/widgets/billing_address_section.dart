import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/texts/row_text_widget.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class EBillingAddressSection extends StatelessWidget{
  const EBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RowTextButton(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}, showActionButton: true,),
        Text('Hussain Yousof', style:theme .bodyLarge),
          SizedBox(height: TSizes.spaceBtwItems),
        Row(children: [
          Icon(Icons.phone, color: Colors.grey,size: 16),
          SizedBox(width: TSizes.spaceBtwItems),
          Text('+92-317-984435', style: theme.bodyMedium),

        ]),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(children: [
          Icon(Icons.location_history, color: Colors.grey,size: 16),
          SizedBox(width: TSizes.spaceBtwItems),
          Expanded(child: Text('Herat Province, 23th Street, Afghanistan, World', style: theme.bodyMedium, softWrap: true)),

        ]),
    ],);
  }

}