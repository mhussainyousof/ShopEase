import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';
import 'package:shop_ease/utils/device/device_utility.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
           OnBoardingSkip(),
           
          OnBoardingDotNavigation(),
          
          OnBoardingNextButton()
        ],
      ),
    );
  }
}





