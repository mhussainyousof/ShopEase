import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_ease/data/repositories/authentication/authentication_repository.dart';
import 'package:shop_ease/features/personalization/models/user_model.dart';
import 'package:shop_ease/utils/exceptions/firebase_exceptions.dart';
import 'package:shop_ease/utils/exceptions/format_exceptions.dart';
import 'package:shop_ease/utils/exceptions/platform_exceptions.dart';

//! Connect with Firebase to store users data
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save user record to Firestore 🗂️
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code); // Handle Firebase error 🔥
    } on FormatException catch (_) {
      throw TFormatException(); // Handle format error 📄
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; // Handle platform error 🌐
    } catch (e) {
      throw 'Something went wrong. Please try again'; // General fallback error ⚠️
    }
  }

  // Fetch user details from Firestore 📥
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot); // Return user model 🎁
      } else {
        return UserModel.empty(); // Return empty model if not found ❌
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code); // Handle Firebase error 🔥
    } on FormatException catch (_) {
      throw TFormatException(); // Handle format error 📄
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; // Handle platform error 🌐
    } catch (e) {
      throw 'Something went wrong. Please try again'; // General fallback error ⚠️
    }
  }

  // Update user details 🛠️
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson()); // Update user info 🔄
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code); // Handle Firebase error 🔥
    } on FormatException catch (_) {
      throw TFormatException(); // Handle format error 📄
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; // Handle platform error 🌐
    } catch (e) {
      throw 'Something went wrong. Please try again'; // General fallback error ⚠️
    }
  }

  // Update a single field in user details ✏️
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json); // Update single field 🔄
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code); // Handle Firebase error 🔥
    } on FormatException catch (_) {
      throw TFormatException(); // Handle format error 📄
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message; // Handle platform error 🌐
    } catch (e) {
      throw 'Something went wrong. Please try again'; // General fallback error ⚠️
    }
  }

  // Remove user record from Firestore 🗑️
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete(); // Delete user record 🧹
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  // upload Image
Future<String>uploadImage(String path, XFile image)async{
  try {
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code);
  } on FormatException catch (_) {
    throw TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}
}

