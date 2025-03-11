import 'package:flutter/material.dart';
import 'package:shop_ease/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(onPressed: ()=> OnBoardingController.instance.skipPage(), child: Text('Skip')));
  }
}

