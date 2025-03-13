import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shop_ease/features/authentication/screens/signup/signup.dart';

import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({ super.key });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [

            // 📧 Email Field
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),

            SizedBox(height: TSizes.spaceBtwInputFields),

            // 🔐 Password Field (Add show/hide later)
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash), // 👁️ TODO: Toggle visibility
              ),
            ),

            SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // ✅ Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(()=> ForgetPassword());
                  }, // 🔗 Go to forget password screen
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),

            SizedBox(height: TSizes.spaceBtwSections),

            // 🚀 Sign In Button (Add login logic)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, // TODO: Validate & login
                child: Text(TTexts.signIn),
              ),
            ),

            SizedBox(height: TSizes.spaceBtwItems),

            // ✨ Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => SignupScreen());
                },
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


