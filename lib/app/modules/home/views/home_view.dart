import '../../widgets/bg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../widgets/buttons_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
           const BgImageWidget(),

           const Positioned(
            bottom: 0,
            child: ButtonWidgets(),
          ),
          Positioned(
            bottom: 0,
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                final bannerAd = controller.bannerAd;
                return bannerAd != null
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: bannerAd.size.height.toDouble(),
                          child: AdWidget(ad: bannerAd),
                        ),
                      )
                    : const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
