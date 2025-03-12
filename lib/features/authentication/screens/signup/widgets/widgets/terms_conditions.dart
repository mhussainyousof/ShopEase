import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';



class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(children: [
      SizedBox(width: 24,
          child: Checkbox(value: true, onChanged: (value){})),
      SizedBox(width: TSizes.sm),
      Text.rich(TextSpan(
          children: [
            TextSpan(
                text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall
            ),
            TextSpan(text: TTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? Colors.white : TColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? Colors.white : TColors.primary,
            )),
            TextSpan(
              text: ' ${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall,

            ),
            TextSpan(text: TTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? Colors.white : TColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? Colors.white : TColors.primary,
            )),
          ]
      ))

    ],);
  }
}
