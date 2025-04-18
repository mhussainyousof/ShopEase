import 'package:get/get.dart';
import 'package:shop_ease/features/shop/controllers/mock_categories.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';


class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();


//  final _db = FirebaseFirestore.instance;

 Future<List<CategoryModel>> getAllCategories()async{
   try{
     await Future.delayed(const Duration(milliseconds: 300)); 
      return mockCategories;
  //  final snapShot = await _db.collection('Categories').get();

  //  final list = snapShot.docs.map((document)=> CategoryModel.fromSnapshot(document)).toList();
  //  return list;
   }
  //  on FirebaseException catch(e){
  //    throw TFirebaseException(e.code).message;
  //  }
  //  on PlatformException catch(e){
  //    throw TPlatformException(e.code).message;
  //  }
   catch(e){
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
