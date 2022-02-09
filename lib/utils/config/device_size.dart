import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData!.size.height;
    screenWidth = mediaQueryData!.size.width;
  }
}

double getScreenHeight(double inputHeight) {
  double? screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight!;
}

double getScreenWidth(double inputWidth) {
  double? screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth!;
}
