import 'package:get/get.dart';
import '../features/authentication/controllers_onboarding/onboarding_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
