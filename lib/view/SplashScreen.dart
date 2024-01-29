// import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';
import 'package:vsp_logistics/res/routes/routes_name.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:vsp_logistics/view/authentication_screens/LoginScreen.dart';

import '../res/assets/images/image_assets.dart';
import 'bottom_navigation/BottomNavigation.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       const Duration(seconds: 3),
  //           () => Get.toNamed(RoutesName.loginScreen),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 5000,
        splashIconSize: 200,
        splash: Image.asset(ImageAssets.logo, height: 200, width: 200),
        nextScreen: LoginScreen(),
        // LandingPage(),
        // splashTransition: SplashTransition.sizeTransition,
        // pageTransitionType: PageTransitionType.rightToLeftJoined,
        backgroundColor: AppColor.whiteColor
    );
  }
}
