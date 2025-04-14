import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/data/repositories/user/user_repository.dart';
import 'package:shop_ease/features/authentication/screens/login/login.dart';
import 'package:shop_ease/features/personalization/models/user_model.dart';
import 'package:shop_ease/features/personalization/screens/profile/widgets/reauthenticate_login_form.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> userModel = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      userModel(user);
      profileLoading.value = false;
    } catch (e) {
      userModel(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Function to save user data from Google Sign-In
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        //! Check if userCredential is not null

        //! Split the full name into parts (first name, last name)
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');

        //! Generate a custom username
        final userName =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        //! Create a new user object with the data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: userName, //! The generated username
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');

        //! Save the user record to the database (FireStore)
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      //! If an error occurs, show a warning message
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong saving your information. You can do it in your profile 😞',
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Sure delete PERMANENTLY?',
      confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          onPressed: () async => deleteUserAccount(),
          child: Text('Delete')),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: Text('Cancel')),
    );
  }

  void deleteUserAccount()async {
   try{
    TFullScreenLoader.openLoadingDialog('Proccessing', TImages.docerAnimation);
     final auth = AuthenticationRepository.instance;
    final provider = auth.authUser!.providerData.map((e)=>e.providerId).first;
    if(provider.isNotEmpty){
      if(provider == 'google.com'){
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        TFullScreenLoader.stopLoading();
        Get.offAll(()=> LoginScreen());
      }else if(provider == 'password'){
        TFullScreenLoader.stopLoading();
        Get.to(()=> ReAuthLoginForm());
      }
    }

   }catch(e){
    TFullScreenLoader.stopLoading();
    TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
   }
  }

  //--------------------------------//

    Future<void> reAuthenticateEmailAndPasswordUser()async {
   try{

     final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;}

      if (!reAuthFormKey.currentState!.validate()) return;

      TFullScreenLoader.openLoadingDialog('Proccessing', TImages.docerAnimation);

       await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
       await AuthenticationRepository.instance.deleteAccount();
        TFullScreenLoader.stopLoading();
        Get.offAll(()=> LoginScreen());

   }catch(e){
    TFullScreenLoader.stopLoading();
    TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
   }
  }
}
