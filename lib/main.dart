import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vsp_logistics/data/providers/language_provider.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';
import 'package:vsp_logistics/res/localization/languages.dart';
import 'package:vsp_logistics/res/localization/locale_type.dart';
import 'package:vsp_logistics/res/routes/routes.dart';
import 'package:vsp_logistics/res/routes/routes_name.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('language_box');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  // final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // LanguageProvider();
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
    );
    // initPlatformState();
  }
  Map lan = {"English": LocaleType.localeOne, "Hindi": LocaleType.localeTwo, "Telugu": LocaleType.localeThree};

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LanguageProvider(),),
        ],
        child: Consumer<LanguageProvider>(
          builder: (context, themeProvider, child) =>
          GetMaterialApp(
          // builder: (context, child) =>
          //     ResponsiveWrapper.builder(
          //       BouncingScrollWrapper.builder(context, child!),
          //       maxWidth: 1200,
          //       minWidth: 450,
          //       defaultScale: true,
          //       breakpoints: [
          //         const ResponsiveBreakpoint.resize(450, name: MOBILE),
          //         const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          //         const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          //         const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          //         const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          //       ],
          //     ),
          title: 'VSPLogistics',
          translations: Languages(),
          locale: themeProvider.list.isEmpty? lan["English"] : lan[themeProvider.list[0]['language']],
          fallbackLocale: LocaleType.localeOne,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.lightColor2),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.appRoutes(),
          initialRoute: RoutesName.splashScreen,
    ),
        ),
      );
  }
}
