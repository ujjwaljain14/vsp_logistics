
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/fonts/app_fonts.dart';
import '../../res/assets/images/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../view_models/search_screen_viewmodel/SearchScreenViewModel.dart';

class SearchLadle extends StatefulWidget {
  const SearchLadle({Key? key}) : super(key: key);

  @override
  State<SearchLadle> createState() => _SearchLadleState();
}

class _SearchLadleState extends State<SearchLadle> {

  @override
  void initState() {
    var temp = Get.arguments;
    name = temp["name"].toString();
    super.initState();
  }

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("Ladle ${name.toString()}"),
      ),
      body: Column(
        children: [
          Text(

            "${"ladle_bold".tr} ${name.toString()}",
            style: AppStyles.bigFont.copyWith(color: AppColor.neutral100),
          ),
          Text(
            SearchScreenViewModel.data[0].ladleContent == "molten metal"
                ?
            "molten_metal".tr
                :
            SearchScreenViewModel.data[0].ladleContent == "scrap"
                ?
            "scrap".tr
                :
            "liq_steel".tr
            ,
            style: AppStyles.headingFont.copyWith(color: AppColor.neutral50),
          ),

          const SizedBox(height: 25,),

          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 400,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightColor1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("l_check_point".tr,style: AppStyles.cardBoldFont.copyWith(color: AppColor.neutral100),),
                              Text(SearchScreenViewModel.data[0].lastStation,style: AppStyles.normalFont.copyWith(color: AppColor.neutral50),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("l_station_time".tr,style: AppStyles.cardBoldFont.copyWith(color: AppColor.neutral100),),
                              Text(SearchScreenViewModel.data[0].lastStationTime,style: AppStyles.normalFont.copyWith(color: AppColor.neutral50),),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(ImageAssets.checkpoint),
                    ],
                  ),
                ),

                // const SizedBox(height: 25,),
                //
                // Container(
                //   height: 100,
                //   width: 400,
                //   padding: const EdgeInsets.all(10),
                //   margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: AppColor.lightColor1,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           Text("ladle_health".tr,style: AppStyles.cardBoldFont.copyWith(color: AppColor.neutral100),),
                //           Text(SearchScreenViewModel.data[0].ladleHealthPercent,style: AppStyles.normalFont.copyWith(color: AppColor.neutral50),),
                //         ],
                //       ),
                //       Image.asset(ImageAssets.health),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 25,),

                Container(
                  height: 100,
                  width: 400,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightColor1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("ladle_taround_time".tr,style: AppStyles.cardBoldFont.copyWith(color: AppColor.neutral100),),
                          Text(SearchScreenViewModel.data[0].ladleTurnAroundTimes,style: AppStyles.normalFont.copyWith(color: AppColor.neutral50),),
                        ],
                      ),
                      Image.asset(ImageAssets.turnaround),
                    ],
                  ),
                ),

                const SizedBox(height: 25,),

                Container(
                  height: 100,
                  width: 400,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.lightColor1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("ladle_circulation_time".tr,style: AppStyles.cardBoldFont.copyWith(color: AppColor.neutral100),),
                          Text(SearchScreenViewModel.data[0].ladleCirculationTimes,style: AppStyles.normalFont.copyWith(color: AppColor.neutral50),),
                        ],
                      ),
                      Image.asset(ImageAssets.circulationTime),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
