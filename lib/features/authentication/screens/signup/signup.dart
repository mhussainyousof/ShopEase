import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/login_signup/form_divider.dart';
import 'package:shop_ease/common/widgets/login_signup/social_buttons.dart';
import 'package:shop_ease/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';


/// Signup Screen
/// A clean and user-friendly registration interface.
/// Combines form inputs with social authentication options.
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),

      // Scrollable content for smaller screens
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace - 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ---- Title ----
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              SizedBox(height: TSizes.spaceBtwSections),

              // ---- Signup Form Fields ----
              SignupForm(),

              SizedBox(height: TSizes.spaceBtwSections),

              // ---- Divider (OR Sign Up With) ----
              FormDivider(textDivider: TTexts.orSignUpWith.capitalize!),

              SizedBox(height: TSizes.spaceBtwSections),

              // ---- Social Media Signup Buttons ----
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

