import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/controllers/login/login_controller.dart';
import 'package:shop_ease/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shop_ease/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shop_ease/features/authentication/screens/signup/signup.dart';
import 'package:shop_ease/navigation_home.dart';

import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // 📧 Email Field
            TextFormField(
              validator: (value) => EValidator.validateEmail(value),
              controller: controller.email,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),

            SizedBox(height: TSizes.spaceBtwInputFields),

            // 🔐 Password Field (Add show/hide later)
            Obx(() => TextFormField(
                  validator: (value) =>
                      EValidator.validatePassword(  value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    labelStyle: TextStyle(fontSize: 13),
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ), // Toggle password visibility (future enhancement)
                  ),
                )),
            SizedBox(height: TSizes.spaceBtwInputFields / 2),

            //! ✅ Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        })),
                    Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgetPassword());
                  },
                  child: Text(TTexts.forgetPassword),
                ),
              ],
            ),

            SizedBox(height: TSizes.spaceBtwSections),

            // 🚀 Sign In Button (Add login logic)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>controller.emailAndPasswordSignIn(), 
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
