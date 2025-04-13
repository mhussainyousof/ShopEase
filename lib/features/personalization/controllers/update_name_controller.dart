import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/user/user_repository.dart';
import 'package:shop_ease/features/personalization/controllers/user_controller.dart';
import 'package:shop_ease/features/personalization/screens/profile/profile.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class UpdateNameController extends GetxController{
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final UserRepository userRepository = Get.find();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames()async{
    firstName.text = userController.userModel.value.firstName;
    lastName.text = userController.userModel.value.lastName;
  }


  Future<void> updateUserName()async{
    try{
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      //! 🧪 Sanity check: make sure the form isn’t trash
      if (!updateUserNameFormKey.currentState!.validate()) return;

      //! ⏳ Dramatic loading animation because... UX, baby
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        TImages.docerAnimation,
      );

      Map<String, dynamic> name = {'FirstName' : firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.userModel.value.firstName = firstName.text.trim();
      userController.userModel.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated');
      Get.off(()=> ProfileScreen());
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
