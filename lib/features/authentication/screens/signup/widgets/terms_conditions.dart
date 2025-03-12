import 'package:flutter/material.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';



/* -------------------------------------------------------------
 🚀 TermsAndConditions Component
 📄 Description: Displays a checkbox with terms & privacy links.
 🌓 Theme-aware: Adjusts link colors based on light/dark mode.
------------------------------------------------------------- */

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [

        /// ☑️ Agreement Checkbox
        SizedBox(
          width: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),

        SizedBox(width: TSizes.sm),

        // 📜 Terms & Privacy Text Links
        Text.rich(
          TextSpan(
            children: [

              // ➡️ "I agree to"
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              // 🔗 Privacy Policy Link (Theme aware)
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? Colors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? Colors.white : TColors.primary,
                ),
              ),

              // ➕ "and"
              TextSpan(
                text: ' ${TTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              // 🔗 Terms of Use Link (Theme aware)
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? Colors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? Colors.white : TColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
