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
      if (!singupFormKey.currentState!.validate()) return;

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privay Policy & Terms of Use.');
                return;
      }
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImages.docerAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // {
      // TFullScreenLoader.stopLoading();
      // }
      // TFullScreenLoader.stopLoading();


      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);
    TFullScreenLoader.stopLoading();

    TLoaders.successSnackBar(title: 'Congratulatins', message: 'Your account has been created! Verify email to continue');

    Get.to(()=> VerifyEmailScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    
    } 
  }
}
