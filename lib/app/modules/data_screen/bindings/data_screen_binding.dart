import 'package:get/get.dart';

import '../controllers/data_screen_controller.dart';

class DataScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataScreenController>(
      () => DataScreenController(),
    );
  }
}
