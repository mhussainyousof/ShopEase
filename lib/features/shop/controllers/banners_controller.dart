import 'package:get/get.dart';
import 'package:shop_ease/data/repositories/banner/banner_repository.dart';
import 'package:shop_ease/features/shop/models/banner_model.dart';
import 'package:shop_ease/utils/popups/loaders.dart';

class BannerController extends GetxController{
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async{
    try{
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}
