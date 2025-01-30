import 'package:flutter/material.dart';
import '../constants/images.dart';

class BgImageWidget extends StatelessWidget {
  const BgImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.7), BlendMode.srcOver),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  Images.mainScreen), // Replace with your image path
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
