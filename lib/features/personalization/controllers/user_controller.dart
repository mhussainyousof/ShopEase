import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_ease/data/repositories/user/user_repository.dart';
import 'package:shop_ease/features/personalization/models/user_model.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> userModel = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord()async{
try{
  profileLoading.value = true;
  final user = await userRepository.fetchUserDetails();
  userModel(user);
  profileLoading.value = false;
}catch(e){
userModel(UserModel.empty());
}finally{
  profileLoading.value = false;
}
  }


  // Function to save user data from Google Sign-In
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) { //! Check if userCredential is not null

        //! Split the full name into parts (first name, last name)
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');

        //! Generate a custom username
        final userName = UserModel.generateUsername(userCredential.user!.displayName ?? '');

        //! Create a new user object with the data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: userName, //! The generated username
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? ''
        );

        //! Save the user record to the database (FireStore)
        await userRepository.saveUserRecord(user);

      }
    } catch (e) {
      //! If an error occurs, show a warning message
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong saving your information. You can do it in your profile 😞',
      );
    }
  }


}
