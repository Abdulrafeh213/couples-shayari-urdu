import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController


  void goToNextScreen() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(Routes.HOME);
  }
}



