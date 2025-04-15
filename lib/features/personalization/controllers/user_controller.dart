import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/data/repositories/user/user_repository.dart';
import 'package:shop_ease/features/authentication/screens/login/login.dart';
import 'package:shop_ease/features/personalization/models/user_model.dart';
import 'package:shop_ease/features/personalization/screens/profile/widgets/re_authenticate_login_form.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Reactive user model
  Rx<UserModel> userModel = UserModel.empty().obs;

  // Repository
  final userRepository = Get.put(UserRepository());

  // UI state
  final profileLoading = false.obs;
  final hidePassword = false.obs;

  // Controllers for re-auth form
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord(); // Load user data when controller initializes
  }

  // Fetch user data from repository
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      userModel(user);
    } catch (e) {
      userModel(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user data after Google sign-in
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if(userModel.value.id.isNotEmpty){
        if (userCredential != null) {
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUsername(userCredential.user!.displayName ?? '');

          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong saving your information. You can do it in your profile 😞',
      );
    }
  }

  // Show account deletion confirmation dialog
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Sure delete PERMANENTLY?',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
        onPressed: () async => deleteUserAccount(),
        child: Text('Delete'),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text('Cancel'),
      ),
    );
  }

  // Delete account based on auth provider
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle(); // Re-authenticate with Google
          await auth.deleteAccount();     // Then delete account
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLoginForm()); // Navigate to re-auth form
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re-authenticate with email/password and delete account
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      if (!reAuthFormKey.currentState!.validate()) return;

      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );

      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


  //---------------//

uploadUserProfilePicture()async{

}
}
