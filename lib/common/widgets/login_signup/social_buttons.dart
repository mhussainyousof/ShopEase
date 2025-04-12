import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/authentication/controllers/login/login_controller.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';


class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
        GestureDetector(
          onTap: () => controller.googleSignIn(),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              TImages.google,
              width:TSizes.iconLg - 2,
              height: TSizes.iconLg - 2,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Facebook Button
        GestureDetector(
          onTap: () {},
          child: Container(
    padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              TImages.facebook,
              width:TSizes.iconLg,
              height: TSizes.iconLg,

            ),
          ),
        ),
      ],
    );
  }
}


