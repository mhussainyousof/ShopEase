import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';
import 'package:shop_ease/utils/exceptions/platform_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';


class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();


 final _db = FirebaseFirestore.instance;

 Future<List<CategoryModel>> getAllCategories()async{
   try{
   final snapShot = await _db.collection('Categories').get();

   final list = snapShot.docs.map((document)=> CategoryModel.fromSnapshot(document)).toList();
   return list;
   }
   on FirebaseException catch(e){
     throw TFirebaseException(e.code).message;
   }
   on PlatformException catch(e){
     throw TPlatformException(e.code).message;
   }
   catch(e){
  throw 'Something went wrong. Please try again';
   }
 }

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Categories")
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map((e) => CategoryModel.fromSnapshot(e))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

}
