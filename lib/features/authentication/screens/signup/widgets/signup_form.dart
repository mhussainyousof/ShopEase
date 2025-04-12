import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shop_ease/features/authentication/screens/signup/widgets/terms_conditions.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/validators/validation.dart';

/// Signup Form Widget
/// A reusable and responsive form for user registration.
/// Includes input fields for user credentials and basic validation structure.
class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.singUpFormKey,
      child: Column(
        children: [
          //! ---- First & Last Name Fields ----
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      EValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.firstName,
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      EValidator.validateEmptyText('Last name', value),
                  controller: controller.lastName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.lastName,
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          //! ---- Username Field ----
          TextFormField(
            validator: (value) =>
                EValidator.validateEmptyText('Username', value),
            controller: controller.userName,
            decoration: InputDecoration(
              labelText: TTexts.username,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          //! ---- Email Field ----
          TextFormField(
            validator: (value) => EValidator.validateEmail(value),
            controller: controller.email,
            decoration: InputDecoration(
              labelText: TTexts.email,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          //! ---- Phone Number Field ----
          TextFormField(
            validator: (value) => EValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: InputDecoration(
              labelText: TTexts.phoneNo,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          //! ---- Password Field ----
          Obx(() => TextFormField(
                validator: (value) => EValidator.validatePassword(value),
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

          //! SizedBox(height: TSizes.spaceBtwItems),

          //! ---- Terms & Conditions ----
          TermsAndConditions(),

          SizedBox(height: TSizes.md),

          //! ---- Submit Button ----
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () 
                  =>
                  controller.signup(),
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
