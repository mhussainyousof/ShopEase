import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';
import 'package:shop_ease/utils/exceptions/firebase_exceptions.dart';
import 'package:shop_ease/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();


 final _db = FirebaseFirestore.instance;

 Future<List<CategoryModel>> getAllCategories()async{
   try{
   final snapShot = await _db.collection('Categories').get();
   final list = snapShot.docs.map((document)=> CategoryModel.fromSnapshot(document)).toList();
   return list;
   }on FirebaseException catch(e){
     throw TFirebaseException(e.code).message;
   }on PlatformException catch(e){
     throw TPlatformException(e.code).message;
   }catch(e){
  throw 'Something went wrong. Please try again';
   }
 }


 //!
 //  Future<void> uploadDummyData(List<CategoryModel>categories)async{
 //   try{
 //     final storage = Get.put(TFirebaseStorageService());
 //
 //     for(var category in categories){
 //       final file = await storage.getImageDataFromAssets(category.image);
 //       final url = await storage.uploadData('Categories', file, category.name);
 //
 //       category.image = url;
 //     }
 //   }
 //  }
}
