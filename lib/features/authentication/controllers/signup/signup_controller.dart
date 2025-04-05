import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/data/repositories/user/user_repository.dart';
import 'package:shop_ease/features/authentication/screens/signup/verify_email.dart';
import 'package:shop_ease/features/personalization/models/user_model.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();

  void signup() async {
  try {
    // 1. Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TLoaders.warningSnackBar(
        title: 'No Internet',
        message: 'Please connect to the internet and try again.',
      );
      return;
    }

    // 2. Validate form fields
    if (!singupFormKey.currentState!.validate()) {
      return;
    }

    // 3. Check if privacy policy is accepted
    if (!privacyPolicy.value) {
      TLoaders.warningSnackBar(
        title: 'Accept Privacy Policy',
        message: 'You must accept the privacy policy and terms to continue.',
      );
      return;
    }

    // 4. Show loading animation
    TFullScreenLoader.openLoadingDialog(
      "We are processing your information...", 
      TImages.docerAnimation,
    );

    // 5. Create user with Firebase Authentication
    final userCredential = await AuthenticationRepository.instance
        .registerWithEmailAndPassword(
          email.text.trim(), 
          password.text.trim(),
        );

    // 6. Create user model and save to Firestore
    final newUser = UserModel(
      id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: userName.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: '',
    );

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

    // 7. Stop loading animation and show success message
    TFullScreenLoader.stopLoading();
    TLoaders.successSnackBar(
      title: 'Congratulations',
      message: 'Your account has been created! Verify your email to continue.',
    );

    // 8. Navigate to email verification screen
    Get.to(() => VerifyEmailScreen(email: email.text.trim(),));

  } catch (e) {
    // Stop loading and show error message
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(
      title: 'Oops!',
      message: e.toString(),
    );
  }
}
 
}
