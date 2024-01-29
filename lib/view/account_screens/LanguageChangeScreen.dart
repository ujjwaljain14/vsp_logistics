import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vsp_logistics/data/providers/language_provider.dart';
import 'package:vsp_logistics/res/localization/locale_type.dart';

import '../../res/assets/fonts/app_fonts.dart';
import '../../res/colors/app_color.dart';

class LanguageChangeScreen extends StatefulWidget {
  const LanguageChangeScreen({Key? key}) : super(key: key);

  @override
  State<LanguageChangeScreen> createState() => _LanguageChangeScreenState();
}

class _LanguageChangeScreenState extends State<LanguageChangeScreen> {
  Map lan = {"English": LocaleType.localeOne, "Hindi": LocaleType.localeTwo, "Telugu": LocaleType.localeThree};
  List<String> items = ["English", "Hindi", "Telugu"];
  String language = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('select_language'.tr,style: AppStyles.headingFont),
      ),
      body: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          print("--------------> ");
          print(languageProvider.list);
          var list = languageProvider.list;
          String language = list[0]['language'];
          // var selectedLanguage = language == LocaleType.localeOne ? "eng".tr : language == LocaleType.localeTwo ? "hin".tr : "tel".tr;
          return Center(
            child:
            CustomDropdown<String>(
              hintText: 'select_language'.tr,
              items: items,
              initialItem: language,
              onChanged: (value) {
                languageProvider.toggleLanguage(list[0]['key'], value);
                Get.updateLocale(lan[value]);
                language = value;
              },
            ),
          );
        },
      ),
    );
  }
}
