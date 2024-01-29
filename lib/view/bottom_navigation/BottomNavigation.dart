import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vsp_logistics/view/account_screens/AccountScreen.dart';
import '../../res/colors/app_color.dart';
import '../search_screen/Search.dart';
import '../search_screen/SearchScreen.dart';
import '../history/HistoryScreen.dart';
import '../home_screens/HomeScreen.dart';
import 'controller.dart';

BottomNavigationController controller = Get.put(BottomNavigationController());

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> _children = [
    const HomeScreen(),
    // Search(),
    const SearchScreen(),
    HistoryScreen(),
    const AccountScreen(),
  ];

  int selectedIndex = 0;

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    // final labelTextStyle = Theme.of(context)
    //     .textTheme
    //     .titleSmall!
    //     .copyWith(fontFamily: 'Roboto', color: titlecolor, fontSize: 8.0);

    return Scaffold(
        body: _children[selectedIndex],
        // bottomNavigationBar:BottomButton(selectindex:selectedIndex, onTap: () {  selectedIndex = index; },)
        bottomNavigationBar: SizedBox(
          height: 70.0,
          child: SalomonBottomBar(
            currentIndex: selectedIndex,
            onTap: (int index) => setState(() {
              selectedIndex = index;
            }),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: Text("home".tr),
                selectedColor: AppColor.buttonColor,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon:const Icon(Icons.search),
                title: Text("search".tr),
                selectedColor: AppColor.buttonColor,
              ),

              /// Search
              SalomonBottomBarItem(
                icon:const Icon(Icons.history),
                title: Text("history".tr),
                selectedColor: AppColor.buttonColor,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon:const Icon(Icons.person),
                title: Text("account".tr),
                selectedColor:AppColor.buttonColor,
              ),
            ],
          ),

          // BottomBarInspiredInside(
          //   items: const [
          //     TabItem(
          //       icon: Icons.home_outlined,
          //       title: 'ALL',
          //     ),
          //     TabItem(
          //       icon: Icons.search_outlined,
          //       title: 'BRAND',
          //     ),
          //     TabItem(
          //       icon: Icons.discount_outlined,
          //       title: 'CATEGORY',
          //     ),
          //     TabItem(
          //       icon: Icons.person,
          //       title: 'Account',
          //     ),
          //   ],
          //   chipStyle:const ChipStyle(convexBridge: true,),
          //   backgroundColor: Colors.white,
          //   color: Colors.black,
          //   colorSelected:  Colors.white,
          //   indexSelected: selectedIndex,
          //   onTap: (int index) => setState(() {
          //     selectedIndex = index;
          //   }),
          //   itemStyle: ItemStyle.circle,
          //   animated: false,
          // ),
        ),
      );
  }
}
