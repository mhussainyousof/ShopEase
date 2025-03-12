import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/screens/signup/widgets/widgets/terms_conditions.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: TTexts.firstName,
                        labelStyle: TextStyle(fontSize: 13)
                    ),
                  ),
                ),
                SizedBox(width: TSizes.spaceBtwInputFields,),
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
            SizedBox(height: TSizes.spaceBtwInputFields,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: TTexts.username,
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Iconsax.user_edit)
              ),
            ),

            SizedBox(height: TSizes.spaceBtwInputFields,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: TTexts.email,
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Iconsax.direct)
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: TTexts.phoneNo,
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Iconsax.call)
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  labelStyle: TextStyle(fontSize: 13),
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash)
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            TermsAndConditions(),
            SizedBox(height: TSizes.sm,),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text(TTexts.createAccount)),),
          ],
        ));
  }
}

