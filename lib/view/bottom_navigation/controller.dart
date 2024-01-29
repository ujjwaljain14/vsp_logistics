import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;

  @override
  void onInit() {
    tabIndex.value;
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
