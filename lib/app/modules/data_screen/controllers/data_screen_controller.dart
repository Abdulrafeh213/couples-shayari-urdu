import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../constants/text_style.dart';
import '../../../data/data.dart';
import '../../ads/ad_helper.dart';
import '../../constants/app_colors.dart';
import '../../constants/images.dart';
import '../../widgets/funct_widget.dart';

class DataScreenController extends GetxController {
  late InterstitialAd _interstitialAd;
  final isInterstitialLoaded = false.obs;
  late BannerAd _bannerAd;

  Rx<Size> bannerAdSize = Rx<Size>(const Size(0, 0));
  BannerAd get bannerAd => _bannerAd;



  @override
  void onInit() {
    super.onInit();
    onAppBarBack();
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




  void onAppBarBack() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          isInterstitialLoaded.value = true;
        },
        onAdFailedToLoad: (error) {
          print(error);
          _interstitialAd.dispose();
          isInterstitialLoaded.value = false;
        },
      ),
    );
  }

  void showInterstitialAd() {
    _interstitialAd.show();
  }

  List<Widget> generatePositionedWidgets(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < expressions.length; i++) {
      List<String> titleLines = [];
      RegExp splitter = RegExp(r'([؟?،])');

      expressions[i].splitMapJoin(
        splitter,
        onMatch: (match) {
          if (match.group(0) == '؟') {
            if (titleLines.isNotEmpty) {
              titleLines.last += match.group(0)!;
            } else {
              titleLines.add(match.group(0)!);
            }
          } else if (match.group(0) != '،') {
            titleLines.add(match.group(0)!);
          }
          return '';
        },
        onNonMatch: (nonMatch) {
          titleLines.add(nonMatch);
          return nonMatch;
        },
      );

      titleLines = titleLines.where((line) => line.trim().isNotEmpty).toList();
      double calculateMainContainerHeight(List<String> titleLines) {
        double totalHeight = titleLines.length * 40;
        return totalHeight + 80.0;
      }
      widgets.add(
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: calculateMainContainerHeight(titleLines) /
              0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.14,
                height: calculateMainContainerHeight(titleLines),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: AppColor.iconColor.withOpacity(0.8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      for (String line in titleLines)
                        Text(
                          line,
                          style: dataText,
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              Images.whatsapp,
                              height: 30,
                              width: 30,
                            ),
                            onPressed: () async {
                              String messageToShare = expressions[i];
                              await launchWhatsapp(message: messageToShare);
                            },
                          ),
                          const SizedBox(width: 30),
                          IconButton(
                            icon: SvgPicture.asset(
                              Images.share,
                              height: 30,
                              width: 30,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              shareApp(context, expressions[i]);
                            },
                          ),
                          const SizedBox(width: 30),
                          IconButton(
                            icon: SvgPicture.asset(
                              Images.copy,
                              height: 30,
                              width: 30,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              copyToClipboard(context, expressions[i]);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }
}
