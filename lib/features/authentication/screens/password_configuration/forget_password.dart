import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:shop_ease/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/validators/validation.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: TSizes.spaceBtwItems,),
          Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: TSizes.spaceBtwSections * 2),

          Form(
            key: controller.forgetPasswordKey,
            child: TextFormField(
              controller: controller.email,
              validator:  EValidator.validateEmail,
              decoration: InputDecoration(
                labelText: TTexts.email, prefixIcon:Icon(Iconsax.direct_right)
              ),
            ),
          ),

          SizedBox(height: TSizes.spaceBtwSections,),

          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> controller.sendPasswordResetEmail(),

           child: Text(TTexts.submit)),),

        ],
      ),
      ),

    );
  }
}
