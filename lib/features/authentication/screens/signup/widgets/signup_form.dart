import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/screens/signup/widgets/terms_conditions.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';

/// Signup Form Widget
/// A reusable and responsive form for user registration.
/// Includes input fields for user credentials and basic validation structure.
class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          // ---- First & Last Name Fields ----
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
                  expands: false,
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

          // ---- Username Field ----
          TextFormField(
            decoration: InputDecoration(
              labelText: TTexts.username,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          // ---- Email Field ----
          TextFormField(
            decoration: InputDecoration(
              labelText: TTexts.email,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          // ---- Phone Number Field ----
          TextFormField(
            decoration: InputDecoration(
              labelText: TTexts.phoneNo,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwInputFields),

          // ---- Password Field ----
          TextFormField(
            decoration: InputDecoration(
              labelText: TTexts.password,
              labelStyle: TextStyle(fontSize: 13),
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash), // Toggle password visibility (future enhancement)
            ),
          ),

          SizedBox(height: TSizes.spaceBtwItems),

          // ---- Terms & Conditions ----
          TermsAndConditions(),

          SizedBox(height: TSizes.md),

          // ---- Submit Button ----
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement sign-up functionality
              },
              child: Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

