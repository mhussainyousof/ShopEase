import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';

//! USER MUST CONFIRM ITS EMAIL

class VerifyEmailScreen extends StatelessWidget {
  final String? email;
  const VerifyEmailScreen({
    this.email,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: AssetImage(TImages.deliveredEmailIllustration)),

              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //! CHECK EMAIL BUTTON
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.checkEmailVerificationStatus(),
                      child: Text(TTexts.tContinue))),

              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //! SEND EMAIL VERIFICARION
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: Text(TTexts.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
