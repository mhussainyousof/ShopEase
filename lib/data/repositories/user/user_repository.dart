import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/personalization/models/user_model.dart';
import 'package:shop_ease/utils/exceptions/firebase_exceptions.dart';
import 'package:shop_ease/utils/exceptions/format_exceptions.dart';
import 'package:shop_ease/utils/exceptions/platform_exceptions.dart';



//! Connect with Firebase to store users data
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  Future<void> saveUserRecord(UserModel user)async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
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
//--------------------------------------------//
  Future<UserModel> fetchUserDetails()async{
    try{
     final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
     if(documentSnapshot.exists){
       return UserModel.fromSnapshot(documentSnapshot);
     }else{
       return UserModel.empty();
     }
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

  //----------UpdateUserDetail-----------//
  Future<void> updateUserDetails(UserModel updateUser)async{
    try{
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());

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


  //--------------//
  Future<void> updateSingleField(Map<String, dynamic> json)async{
    try{
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);

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

  //----------------//
  Future<void> removeUserRecord(String userId)async{
    try{
      await _db.collection('Users').doc(userId).delete();

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

