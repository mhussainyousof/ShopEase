import 'package:get/get.dart';
import 'package:shop_ease/features/shop/controllers/home_controller.dart';
import 'package:shop_ease/navigation_home.dart';
import 'package:shop_ease/utils/helpers/network_manager.dart';
import '../features/authentication/controllers/onboarding/onboarding_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
    Get.put<NavigationController>(NavigationController());
    Get.put<HomeController>(HomeController());
    Get.put(NetworkManager());

  }
}
