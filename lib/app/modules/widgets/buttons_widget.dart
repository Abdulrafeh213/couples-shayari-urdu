import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import '../../routes/app_pages.dart';
import '../constants/app_colors.dart';
import '../constants/app_text.dart';
import '../constants/images.dart';
import '../constants/text_style.dart';
import 'funct_widget.dart';

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({super.key});

  @override
  Widget build(BuildContext context) {

    Widget customIconButton(String iconAsset, VoidCallback onPressed) {
      return Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: AppColor.fontColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              iconAsset,
              fit: BoxFit.contain,
              height: 35,
              width: 45,
              color: Colors.black,
            ),
            onPressed: onPressed,
          ),
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: AppColor.iconColor.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customIconButton(Images.share, shareApps),
                const SizedBox(width: 30),
                customIconButton(Images.star, openAppStoreForRating),
                const SizedBox(width: 30),
                customIconButton(Images.insurance, termCondition),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customIconButton(Images.moreApps, openMoreApps),
                const SizedBox(width: 30),
                customIconButton(Images.alert, privacyPolicy),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DATA_SCREEN);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.8,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColor.fontColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  Texts.Mb_Text,
                  style: btnStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
