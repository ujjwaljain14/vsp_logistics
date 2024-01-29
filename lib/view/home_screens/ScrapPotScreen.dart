import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/TimeLineComponent.dart';
import '../../res/assets/fonts/app_fonts.dart';
import '../../view_models/HomeScreenViewModel/ScrapPotScreenViewModel.dart';

class ScrapPotScreen extends StatelessWidget {
  const ScrapPotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("scrap_pot".tr, style: AppStyles.headingFont,),
      ),
      body: TimeLineComponent(data: ScrapPotScreenViewModel.stageList,),
    );;
  }
}
