import 'package:flutter/material.dart';
import 'package:shop_ease/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Scaffold(
      body: Stack(
        children: [
          // 📄 PageView - Swipe able onboarding pages
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

          // ⏭️ Skip Button (Top-Right Corner)
          OnBoardingSkip(),

          // 🔵 Dot Indicators (Bottom-Center)
          OnBoardingDotNavigation(),

          // 👉 Next Button (Bottom-Right)
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}





