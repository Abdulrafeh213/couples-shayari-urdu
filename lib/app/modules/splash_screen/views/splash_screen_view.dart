import '../../widgets/bg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../constants/app_text.dart';
import '../../constants/text_style.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(Routes.HOME);
    });
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         BgImageWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200),
                Text(
                  Texts.Main_Text,
                  textAlign: TextAlign.center,
                  style: bigPo,
                ),
                Text(
                  Texts.Title_Name,
                  textAlign: TextAlign.center,
                  style: bigJNK,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
