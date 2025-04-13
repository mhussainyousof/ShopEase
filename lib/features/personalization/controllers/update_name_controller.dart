import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/user/user_repository.dart';
import 'package:shop_ease/features/personalization/controllers/user_controller.dart';
import 'package:shop_ease/features/personalization/screens/profile/profile.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  // Controllers to handle user input for first and last name
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  // Access the userController instance to get user data
  final userController = UserController.instance;

  // Get the UserRepository instance to interact with Firestore
  final UserRepository userRepository = Get.find();

  // Global key for the form validation
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // Initialization function to set the initial values for first and last names
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Function to initialize the first and last name text fields with the current user data
  Future<void> initializeNames() async {
    // Set the initial text of first and last name from the user model
    firstName.text = userController.userModel.value.firstName;
    lastName.text = userController.userModel.value.lastName;
  }

  // Function to handle name update
  Future<void> updateUserName() async {
    try {
      // Check if the device has network connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      // If no connection, do nothing
      if (!isConnected) {
        return;
      }

      // Validate the form (check if the input is correct)
      if (!updateUserNameFormKey.currentState!.validate()) return;

      // Show a loading dialog while the name is being updated
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        TImages.docerAnimation,
      );

      // Prepare the data (new first and last name) to be updated in Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      // Update the name in Firestore using the repository
      await userRepository.updateSingleField(name);

      // Update the local user model with the new name
      userController.userModel.value.firstName = firstName.text.trim();
      userController.userModel.value.lastName = lastName.text.trim();

      // Stop the loading dialog
      TFullScreenLoader.stopLoading();

      // Show a success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated');

      // Navigate to the Profile screen after the update
      Get.off(() => ProfileScreen());
    } catch (e) {
      // Stop the loading dialog if an error occurs
      TFullScreenLoader.stopLoading();

      // Show an error message
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}

