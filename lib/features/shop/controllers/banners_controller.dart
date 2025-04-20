import 'package:get/get.dart';

class BannerController extends GetxController{
  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index){
    carouselCurrentIndex.value = index;
  }
}
