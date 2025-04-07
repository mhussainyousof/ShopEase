import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';



class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [

        /// ☑️ Agreement Checkbox
        SizedBox(
          width: 24,
          child: Obx(()=> Checkbox(
            
            value: controller.privacyPolicy.value,
            onChanged: (value) => controller.privacyPolicy.value =! controller.privacyPolicy.value,
            ))
        ),

        SizedBox(width: TSizes.sm),

        // !📜 Terms & Privacy Text Links
        Text.rich(
          TextSpan(
            children: [

              //! ➡️ "I agree to"
              TextSpan(
                text: '${TTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              //! 🔗 Privacy Policy Link (Theme aware)
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? Colors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? Colors.white : TColors.primary,
                ),
              ),

              //! ➕ "and"
              TextSpan(
                text: ' ${TTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              // !🔗 Terms of Use Link (Theme aware)
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
