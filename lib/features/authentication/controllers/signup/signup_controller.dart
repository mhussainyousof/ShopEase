import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shop_ease/utils/constants/image_strings.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import 'package:shop_ease/utils/popups/full_screen_loader.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shop_ease/utils/popups/loaders.dart';


class SignupController extends GetxController{
  static SignupController get instance => Get.find();



  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();

  Future<void> signup()async{   

    try{
      
      TFullScreenLoader.openLoadingDialog("We are processing your information...", TImages.animalIcon);
      
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected)
        return;
      // {
        // TFullScreenLoader.stopLoading();
      // }

      if(!singupFormKey.currentState!.validate())
        // TFullScreenLoader.stopLoading(); 
        return;
      

    } catch(e){
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    } finally{
      TFullScreenLoader.stopLoading();
    }
  }
}




