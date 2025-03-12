import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/styles/spacing_styles.dart';
import 'package:shop_ease/common/widgets/login_signup/form_divider.dart';
import 'package:shop_ease/common/widgets/login_signup/social_buttons.dart';
import 'package:shop_ease/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shop_ease/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';

/* ============================================================
   🎯 LoginScreen Widget
   ✨ Displays the Login UI components inside a scrollable view.
   🌓 Theme aware + Clean Layout
============================================================ */

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 📱 Entire screen is scrollable to avoid overflow
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,  // 🧱 Top padding with appbar space
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // 📐 Align content to start
            children: [

              // 🏷️ Login Header Section
              LoginHeader(),

              SizedBox(height: TSizes.spaceBtwSections / 2),

              // 📝 Login Form (Email + Password + Button)
              TLoginForm(),

              SizedBox(height: TSizes.spaceBtwSections),

              // ➖ Divider with text "OR SIGN IN WITH" ➖
              FormDivider(
                textDivider: TTexts.orSignInWith.capitalize!,
              ),

              SizedBox(height: TSizes.spaceBtwSections),

              // 🔗 Social Media Login Buttons (Google, Facebook, etc.)
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


