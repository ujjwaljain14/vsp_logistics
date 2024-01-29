import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/components/TimeLineComponent.dart';
import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';

import '../../view_models/HomeScreenViewModel/HotMetalScreenViewModel.dart';

class HotMetalScreen extends StatelessWidget {
  const HotMetalScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hot_metal".tr, style: AppStyles.headingFont,),
      ),
      body: TimeLineComponent(data: HotMetalScreenViewModel.stageList,),
    );
  }
}
