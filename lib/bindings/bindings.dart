import 'package:get/get.dart';
import 'package:shop_ease/features/shop/controllers/home_controller.dart';
import 'package:shop_ease/navigation_home.dart';
import '../features/authentication/controllers_onboarding/onboarding_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
    Get.put<NavigationController>(NavigationController());
    Get.put<HomeController>(HomeController());

  }
}
