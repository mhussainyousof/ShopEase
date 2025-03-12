import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/login_signup/form_divider.dart';
import 'package:shop_ease/common/widgets/login_signup/social_buttons.dart';
import 'package:shop_ease/features/authentication/screens/signup/widgets/widgets/signup_form.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace - 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: TSizes.spaceBtwSections,),

              SignupForm(),

                  SizedBox(height: TSizes .spaceBtwSections,),

                  FormDivider(textDivider: TTexts.orSignUpWith.capitalize!),

                  SizedBox(height: TSizes .spaceBtwSections,),

                  SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

