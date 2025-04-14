import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/personalization/controllers/user_controller.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return PopScope(
      canPop: true,

      // 🔙 Clear inputs when user presses back
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) {
          controller.verifyEmail.clear();
          controller.verifyPassword.clear();
        }
      },

      child: Scaffold(
        appBar: AppBar(title: Text('Re_Authenticate User')), // 🧾 Page title

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
              key: controller.reAuthFormKey, // 🗝️ Form validation key
              child: Column(
                children: [
                  // 📧 Email input field
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: EValidator.validateEmail,
                    decoration: InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwInputFields),

                  // 🔐 Password input field with toggle visibility
                  Obx(() => TextFormField(
                    controller: controller.verifyPassword,
                    validator: EValidator.validatePassword,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                      ),
                    ),
                  )),
                  SizedBox(height: TSizes.spaceBtwInputFields),

                  // ✅ Verify button to trigger re-authentication
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPasswordUser(),
                      child: Text('Verify'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
