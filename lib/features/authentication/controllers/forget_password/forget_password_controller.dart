import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController {
  // Singleton instance of the controller for easy access via GetX
  static ForgetPasswordController get instance => Get.find();

  // Text editing controller for email input field
  final email = TextEditingController();

  // GlobalKey to manage and validate the form state
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  /// Sends a password reset email to the user-entered email address.
  /// Validates network connection and form before proceeding.
  sendPasswordResetEmail() async {
    try {
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Validate form (e.g., email format, non-empty)
      if (!forgetPasswordKey.currentState!.validate()) return;

      // Show loading animation
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      // Attempt to send reset email through authentication service
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Hide loader and show success message
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Sent to Reset Your Password'.tr,
      );

      // Navigate to Reset Password screen with the current email
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Handle any exception by stopping the loader and showing error snackbar
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Allows resending a password reset email using a passed-in email.
  resendPasswordResetEmail(String email) async {
    try {
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Show loading animation
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      // Attempt to send the reset email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Stop loader and show success message
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Sent to Reset Your Password'.tr,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}

