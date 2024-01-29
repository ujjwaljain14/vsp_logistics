import 'package:flutter/material.dart';


class AppFonts {

  static const String outfit = 'Outfit';
}

class AppStyles{

  static TextStyle buttonTextFont = const TextStyle(
    fontFamily: AppFonts.outfit,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );

  static TextStyle bigFont = const TextStyle(
    fontFamily: AppFonts.outfit,
    fontWeight: FontWeight.w800,
    fontSize: 20.0,
  );

  static TextStyle headingFont = const TextStyle(
    fontFamily: AppFonts.outfit,
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
  );

  static TextStyle cardBoldFont = const TextStyle(
    fontFamily: AppFonts.outfit,
    fontWeight: FontWeight.w800,
    fontSize: 15.0,
  );

  static TextStyle boldFont = const TextStyle(
    fontFamily: AppFonts.outfit,
    fontWeight: FontWeight.w800,
    fontSize: 14.0,
  );

  static TextStyle smallFont = const TextStyle(
    fontFamily: AppFonts.outfit,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
  );
  static TextStyle normalFont = const TextStyle(
    fontFamily: AppFonts.outfit,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  );



}
// style: FontTheme.contentFont.copyWith(color: Colors.black),
// style: FontTheme.screenTitleFont.copyWith(color: titlecolor),