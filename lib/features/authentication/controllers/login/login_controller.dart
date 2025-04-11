import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final RxBool rememberMe = false.obs;
  final RxBool hidePassword = true.obs;

  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  void onInit() {
    final savedEmail = localStorage.read('remember_me_email');
    final savedPassword = localStorage.read('remember_me_password');

    if (savedEmail != null) {
      email.text = savedEmail;
    }
    if (savedPassword != null) {
      password.text = savedPassword;
    }
    super.onInit();
  }

  
  Future<void> emailAndPasswordSignIn() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
          title: 'No Internet',
          message: 'Please connect to the internet and try again.',
        );
        return;
      }

      if (!loginKey.currentState!.validate()) {
        return;
      }

      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      if (rememberMe.value) {
        localStorage.write('remember_me_email', email.text.trim());
        localStorage.write('remember_me_password', password.text.trim());
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
