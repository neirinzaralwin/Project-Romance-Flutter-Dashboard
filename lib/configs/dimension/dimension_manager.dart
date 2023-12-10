import 'package:flutter/material.dart';

class DM {
  static double screenWidth = MediaQueryData.fromView(WidgetsBinding.instance.renderView.flutterView).size.width;
  static double screenHeight = MediaQueryData.fromView(WidgetsBinding.instance.renderView.flutterView).size.height;

  static int tabletview = 768;
  static int ultrawideview = 1400;

// profile circle
  static double profileCircleSmall = DM.width30;
  static double profileCircleLarge = DM.width40 * 3;

//height
  static double height10 = screenHeight / 71.5;
  static double height20 = screenHeight / 35.75;
  static double height30 = screenHeight / 23.83;
  static double height40 = screenHeight / 17.88;
  static double height50 = screenHeight / 14.3;
  static double height15 = screenHeight / 47.67;
  //fonts
  static double font7 = screenWidth * 0.025;
  static double font8 = screenWidth * 0.028;
  static double font9 = screenWidth * 0.032;
  static double font10 = screenWidth * 0.035;
  static double font11 = screenWidth * 0.038;
  static double font12 = screenWidth * 0.04;
  static double font13 = screenWidth * 0.043;
  static double font14 = screenWidth * 0.045;
  static double font15 = screenWidth * 0.048;
  static double font16 = screenWidth * 0.05;
  static double font17 = screenWidth * 0.053;
  static double font18 = screenWidth * 0.055;
  static double font19 = screenWidth * 0.058;
  static double font20 = screenWidth * 0.06;
  static double font21 = screenWidth * 0.063;
  static double font22 = screenWidth * 0.065;
  static double font23 = screenWidth * 0.068;
  static double font24 = screenWidth * 0.07;
  static double font25 = screenWidth * 0.073;
  static double font26 = screenWidth * 0.075;
  //radius
  static double radius20 = screenHeight / 35.75;
  static double radius30 = screenHeight / 23.83;
  static double radius15 = screenHeight / 47.67;
  //width
  static double width10 = screenHeight / 71.5;
  static double width5 = screenHeight / 143;
  static double width15 = screenHeight / 47.67;
  static double width20 = screenHeight / 35.75;
  static double width30 = screenHeight / 23.83;
  static double width40 = screenHeight / 17.88;
  static double width50 = screenHeight / 14.3;

  static double size24 = screenHeight / 29.79;
  static double size25 = screenHeight / 28.6;
  static double size18 = screenHeight / 39.72;
//iconsSize
  static double iconSize16 = screenHeight / 44.81;
  static double iconSize25 = screenHeight / 28.6;
  static double iconSize32 = iconSize16 * 2;

//pageviewhienght
  static double pageViewContainer = screenHeight / 3.25;
  static double pageViewTextContainer = screenHeight / 5.96;
}
