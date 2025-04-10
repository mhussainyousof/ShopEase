import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_ease/common/styles/spacing_styles.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: TSpacingStyle.paddingWithAppbarHeight * 2,
        child: Column(
          children: [
            Lottie.asset(image, width: THelperFunctions.screenWidth() * 0.6),

            SizedBox(height: TSizes.spaceBtwSections),
            Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),

            SizedBox(height: TSizes.spaceBtwItems),

            SizedBox(height: TSizes.spaceBtwItems,),
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwSections,),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: Text(TTexts.tContinue)),),

          ],
        ),
        ),
      ),
    );
  }
}
