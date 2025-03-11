import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_ease/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:shop_ease/utils/constants/colors.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/device/device_utility.dart';
import 'package:shop_ease/utils/helpers/helper_functions.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(), right: TSizes.defaultSpace,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: CircleBorder(), backgroundColor: dark ? TColors.primary : Colors.black),
          onPressed: ()=> OnBoardingController.instance.nextPage() , child: Icon(Iconsax.arrow_right_3, color: TColors.white,),),

    );
  }
}