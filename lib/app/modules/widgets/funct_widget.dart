import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

Future<void> launchWhatsapp({required String message}) async {
  final urlString = 'whatsapp://send?text=$message';
  final url = Uri.parse(urlString);
  if (!await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    await launchUrl(url);
  }
}

void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Copied to clipboard')),
  );
}

void shareApp(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  Share.share('$text');
}

void openAppStoreForRating() async {
  final url =
      'https://play.google.com/store/apps/details?id=com.sad.poetry.udaas.shayari';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void openMoreApps() async {
  final url =
      'https://play.google.com/store/apps/details?id=com.sad.poetry.udaas.shayari';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void termCondition() async {
  final url =
      'https://docs.google.com/document/d/15SMxBRga6lFtDuItaxdN9ACeV5p8c0Z9LTCj2qhEp8w/edit?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void privacyPolicy() async {
  final url =
      'https://docs.google.com/document/d/17B3bUtVHsRsYfHkDToa1PWpU_L3kFuikmbGbAyeUYNI/edit?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void shareApps() {
  Share.share(
      'Express your love with our collection of romantic couple Shayari in Urdu! Share heartfelt verses with your partner and celebrate your special bond. Download now and spread the joy of love through poetry! Download now https://play.google.com/store/apps/details?id=com.couples.shayari.In.urdu');
}