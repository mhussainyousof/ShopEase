import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  sendPasswordResetEmail()async{
    try{
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!forgetPasswordKey.currentState!.validate()) return;


      //! ⏳ Dramatic loading animation because... UX, baby
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);
      Get.to(()=> ResetPasswordScreen(email: email.text.trim()));

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email)async{
    try{
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }


      //! ⏳ Dramatic loading animation because... UX, baby
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset Your Password'.tr);

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}
