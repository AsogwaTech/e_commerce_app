import 'package:get/get.dart';

// for responsiveness in different media sizes

class Dimensions{
  //static class was used here in order to have access to it in any page of our project using its cast name(class name)
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // the scaling factor used here was gotten from the current media size i am using divided by the sizes of each container i will be using in my project

  static double firstScrollableStack220 = screenHeight/3.42;
  static double secondScrollableStack120 = screenHeight/6.27;
  static double parentContainer320 = screenHeight/2.35;

  // for the sized box between the text in the second scrollable Stack dynamically

  static double firstSizedBox10 = screenHeight/75.2;
  static double firstSizedBox20 = screenHeight/37.6;

  //heights
  static double paddingTopBottom10 = screenHeight/75.2;
  static double topBottom30 = screenHeight/25.07;
  static double topBottom10 = screenHeight/75.2;
  static double topBottom15 = screenHeight/50.13;
  static double topBottom45 = screenHeight/16.71;
  static double bigTextSize20 = screenHeight/37.6;// text size
  static double bigTextSize26 = screenHeight/28.9;//************************
  static double smallText16 = screenHeight/47;

// border radius
  static double borderBigContainer30 = screenHeight/25.07;
  static double borderSmallContainer20 = screenHeight/37.6;

  //padding and margin width
  static double rightLeft10 = screenHeight/75.2;
  static double rightLeft45 = screenHeight/16.71;
  static double rightLeft15 = screenHeight/50.13;
  static double rightLeft20 = screenHeight/37.6;
  static double rightLeft30 = screenHeight/25.07;


 // icon size. Note: The default icon size in flutter is 24
  static double iconSize24 = screenHeight/31.33;
  static double iconSize16 = screenHeight/47.0;


  static double topBottom100 = screenHeight/7.52;
  static double topBottom200 = screenHeight/3.76;

  // popular page
static double popularImageHeight = screenHeight/2.15;

}