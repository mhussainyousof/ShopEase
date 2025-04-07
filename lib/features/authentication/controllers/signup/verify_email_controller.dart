import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:get/get.dart'; 
import 'package:shop_ease/common/widgets/success_screen/success_screen.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart'; 
import 'package:shop_ease/utils/constants/image_strings.dart'; 
import 'package:shop_ease/utils/constants/text_strings.dart'; 
import 'package:shop_ease/utils/popups/loaders.dart'; 

class VerifyEmailController extends GetxController {
  //! Singleton instance to access this controller from anywhere
  static VerifyEmailController get instance => Get.find();

  //! Called when the controller is initialized
  @override
  void onInit() {
    sendEmailVerification(); // Sends email verification
    setTimeForAutoRedirect(); // Starts timer to check email verification status
    super.onInit();
  }

  //! Sends a verification email to the user's email address
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your Email.',
      );
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }

  //! Periodically checks if the user's email has been verified
  setTimeForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload(); // Refresh user info
      final user = FirebaseAuth.instance.currentUser;

      // If email is verified, cancel timer and navigate to success screen
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
          image: TImages.successfulRegisterAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () =>
              AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }

  //! Manually checks email verification status and redirects if verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
        image: TImages.successfulRegisterAnimation,
        title: TTexts.yourAccountCreatedTitle,
        subTitle: TTexts.yourAccountCreatedSubTitle,
        onPressed: () =>
            AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}
