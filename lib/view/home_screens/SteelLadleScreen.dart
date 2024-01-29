import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/TimeLineComponent.dart';
import '../../res/assets/fonts/app_fonts.dart';
import '../../view_models/HomeScreenViewModel/SteelLadleScreenViewModel.dart';

class SteelLadleScreen extends StatelessWidget {
  const SteelLadleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("steel_ladle".tr, style: AppStyles.headingFont,),
      ),
      body: TimeLineComponent(data: SteelLadleScreenViewModel.stageList,),
    );
  }
}
