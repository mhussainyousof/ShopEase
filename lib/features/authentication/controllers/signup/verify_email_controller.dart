import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit(){
    sendEmailVerification();
    super.onInit();
  }


  sendEmailVerification()async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent', message:'Please check your inbox and verify your Email.'); 
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString()); 
    }
  }


}  