import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/styles/spacing_styles.dart';
import 'package:shop_ease/common/widgets/login_signup/form_divider.dart';
import 'package:shop_ease/common/widgets/login_signup/social_buttons.dart';
import 'package:shop_ease/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shop_ease/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              LoginHeader(),
              TLoginForm(),

              FormDivider(
                  textDivider: TTexts.orSignInWith.capitalize!
              ),

              SizedBox(height: TSizes.spaceBtwSections,),

              SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

