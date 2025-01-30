import '../../widgets/bg_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../constants/app_text.dart';
import '../../constants/images.dart';
import '../../constants/text_style.dart';
import '../controllers/data_screen_controller.dart';

class DataScreenView extends GetView<DataScreenController> {
  const DataScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isInterstitialLoaded = Get.find<DataScreenController>()
            .isInterstitialLoaded
            .value;
        if (isInterstitialLoaded) {
          Get.find<DataScreenController>().showInterstitialAd();
          Navigator.pop(context);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.header),
                fit: BoxFit.fill,
              ),
            ),
          ),
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  final isInterstitialLoaded = Get.find<DataScreenController>()
                      .isInterstitialLoaded
                      .value;
                  if (isInterstitialLoaded) {
                    Get.find<DataScreenController>().showInterstitialAd();
                    Navigator.pop(context);
                    return;
                  } else {
                    return;
                  }
                },
              ),
            ],
          ),
          title: const Text(
            Texts.AppBar_Text,
            textAlign: TextAlign.justify,
            style: smallPopins,
          ),
        ),
        body: GetBuilder<DataScreenController>(
          init: DataScreenController(),
          builder: (controller) {
            return Stack(
              fit: StackFit.expand,
              children: [
                 BgImageWidget(),
                SingleChildScrollView(
                  child: Column(
                    children: controller.generatePositionedWidgets(context),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: GetBuilder<DataScreenController>(
                    init: DataScreenController(),
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
            );
          },
        ),
      ),
    );
  }
}
