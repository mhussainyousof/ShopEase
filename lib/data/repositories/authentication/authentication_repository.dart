import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_ease/features/authentication/screens/login/login.dart';
import 'package:shop_ease/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shop_ease/features/authentication/screens/signup/verify_email.dart';
import 'package:shop_ease/navigation_home.dart';
import 'package:shop_ease/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:shop_ease/utils/exceptions/firebase_exceptions.dart';
import 'package:shop_ease/utils/exceptions/format_exceptions.dart';
import 'package:shop_ease/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user= _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(()=>NavigationHome());
      }
      else{
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }
    else{
            deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(OnBoardingScreen());
      }}

    /// [EmailAuthentication] - LOGIN

    Future<UserCredential> loginWithEmailAndPassword(String email, String password)async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    }on FormatException catch(_){
      throw TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }




  Future<UserCredential> registerWithEmailAndPassword(String email, String password)async{
    try{
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
    final credentials = GoogleAuthProvider.credential();

    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    }on FormatException catch(_){
      throw TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserCredential> signInWithGoogle(String email, String password)async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    }on FormatException catch(_){
      throw TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  Future<void> sendEmailVerification()async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    }on FormatException catch(_){
      throw TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


Future<void>logout()async{ 
  try{
    await FirebaseAuth.instance.signOut();
    
    Get.offAll(()=> LoginScreen());
  }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code);
    }on FormatException catch(_){
      throw TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
}

}
 