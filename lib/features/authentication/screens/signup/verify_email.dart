import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/common/widgets/success_screen/success_screen.dart';
import 'package:shop_ease/features/authentication/screens/login/login.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.offAll(LoginScreen()), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          Image(image: AssetImage(TImages.deliveredEmailIllustration)),

          Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),

          SizedBox(height: TSizes.spaceBtwItems,),

          Text('example@hussian.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),

          SizedBox(height: TSizes.spaceBtwItems,),

          Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),

          SizedBox(height: TSizes.spaceBtwSections,),

          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> SuccessScreen(
            image: TImages.staticSuccessIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed:()=> Get.to(()=> LoginScreen()),
          )), child: Text(TTexts.tContinue)),),

          SizedBox(height: TSizes.spaceBtwItems,),

          SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: Text(TTexts.resendEmail)),)
        ],),
        ),

      ),
    );
  }
}

