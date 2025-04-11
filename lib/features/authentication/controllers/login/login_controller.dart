import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class LoginController extends GetxController {
  //! 🧠 Reactive states for the Login screen — like mood swings but for UI
  final RxBool rememberMe = false.obs;
  final RxBool hidePassword = true.obs;

  //! 🗃️ Local cache boss — keeps your secrets (email & password) safe-ish
  final localStorage = GetStorage();

  //! 🧾 Input fields — here’s where you scream your email & password
  final email = TextEditingController();
  final password = TextEditingController();

  //! 🛡️ Form guardian — blocks weak forms like Gandalf: “You shall not pass!”
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  void onInit() {
    //! 🔍 Spy mode activated — checking if you’ve stored anything in the vault
    final savedEmail = localStorage.read('remember_me_email');
    final savedPassword = localStorage.read('remember_me_password');

    //! 🧠 Autocomplete your life if saved creds exist
    if (savedEmail != null) email.text = savedEmail;
    if (savedPassword != null) password.text = savedPassword;

    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    //! 🚀 Main login launcher — validates you, saves stuff, and warps you into the app

    try {
      //! 🌐 First things first: are we online, or yelling into the void?
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //! 📢 No bars = no login. Go find WiFi, champ.
        TLoaders.warningSnackBar(
          title: 'No Internet',
          message: 'Please connect to the internet and try again.',
        );
        return;
      }

      //! 🧪 Sanity check: make sure the form isn’t trash
      if (!loginKey.currentState!.validate()) return;

      //! ⏳ Dramatic loading animation because... UX, baby
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.docerAnimation,
      );

      //! 💾 If “Remember Me” is ON, we play butler and save your info
      if (rememberMe.value) {
        localStorage.write('remember_me_email', email.text.trim());
        localStorage.write('remember_me_password', password.text.trim());
      }

      //! 🔐 Real-deal Firebase login happening here
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //! 🎉 We did it! Turn off loading and teleport the user
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      //! 💥 Something exploded. Catch it. Tell the user it sucks.
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
