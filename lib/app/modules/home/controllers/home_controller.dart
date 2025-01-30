import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../ads/ad_helper.dart';

class HomeController extends GetxController {
  late BannerAd _bannerAd;

  Rx<Size> bannerAdSize = Rx<Size>(const Size(0, 0));
  BannerAd get bannerAd => _bannerAd;


  @override
  void onInit() {
    super.onInit();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
         update();
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }
}
