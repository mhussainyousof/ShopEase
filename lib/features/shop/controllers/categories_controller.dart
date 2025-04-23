import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/category_repository/category_repository.dart';
import 'package:shop_ease/data/repositories/product/product_repository.dart';
import 'package:shop_ease/features/shop/models/categories_model.dart';
import 'package:shop_ease/features/shop/models/product_model.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async{
    try{
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      
      featuredCategories.assignAll(allCategories.where((category)=> category.isFeatured && category.parentId.isEmpty).take(8).toList());
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  //! Get Category or Sub-Category Products.
Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
  //! Fetch limited (4) products against each subCategory;
  final products = await ProductRepository.instance.getProductsForCategory(
    categoryId: categoryId,
    limit: limit,
  );
  return products;
}

}
