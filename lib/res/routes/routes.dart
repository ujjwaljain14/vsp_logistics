import 'package:get/get.dart';
import 'package:vsp_logistics/res/routes/routes_name.dart';
import 'package:vsp_logistics/view/account_screens/AccountScreen.dart';
import 'package:vsp_logistics/view/account_screens/LanguageChangeScreen.dart';
import 'package:vsp_logistics/view/authentication_screens/LoginScreen.dart';
import 'package:vsp_logistics/view/authentication_screens/SignUpScreen.dart';
import 'package:vsp_logistics/view/bottom_navigation/BottomNavigation.dart';
import 'package:vsp_logistics/view/home_screens/HomeScreen.dart';
import 'package:vsp_logistics/view/history//HistoryScreen.dart';
import 'package:vsp_logistics/view/home_screens/HotMetalScreen.dart';
import 'package:vsp_logistics/view/home_screens/SteelLadleScreen.dart';
import '../../view/search_screen/Search.dart';
import '../../view/search_screen/SearchLadle.dart';
import '../../view/search_screen/SearchScreen.dart';
import '../../view/home_screens/ScrapPotScreen.dart';
import '../../view/SplashScreen.dart';

class AppRoutes{

  static appRoutes()=>
    [
      GetPage(
          name: RoutesName.splashScreen,
          page: ()=> const SplashScreen(),
          transition: Transition.noTransition
      ),
      GetPage(
          name: RoutesName.bottomNavigation,
          page: ()=> const BottomNavigation(),
          transition: Transition.noTransition
      ),
      GetPage(
          name: RoutesName.loginScreen,
          page: ()=> LoginScreen(),
          transition: Transition.noTransition
      ),GetPage(
          name: RoutesName.signUpScreen,
          page: ()=> SignUpScreen(),
          transition: Transition.noTransition
      ),
      GetPage(
          name: RoutesName.homeScreen,
          page: ()=> const HomeScreen(),
          transition: Transition.fadeIn
      ),
      GetPage(
          name: RoutesName.hotMetalScreen,
          page: ()=> const HotMetalScreen(),
      ),
      GetPage(
        name: RoutesName.steelLadleScreen,
        page: ()=> const SteelLadleScreen(),
      ),
      GetPage(
        name: RoutesName.scrapPotScreen,
        page: ()=> const ScrapPotScreen(),
      ),
        GetPage(
            name: RoutesName.accountScreen,
            page: ()=> const AccountScreen(),
        ),
      GetPage(
        name: RoutesName.languageChangeScreen,
        page: ()=> const LanguageChangeScreen(),
      ),
      GetPage(
          name: RoutesName.searchScreen,
          page: ()=> const SearchScreen(),
      ),GetPage(
          name: RoutesName.search,
          page: ()=> const Search(),
      ),GetPage(
          name: RoutesName.searchLadle,
          page: ()=> const SearchLadle(),
      ),
      GetPage(
          name: RoutesName.historyScreen,
          page: ()=>  HistoryScreen(),
      ),
    ];
}