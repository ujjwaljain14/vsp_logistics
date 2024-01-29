import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';
import 'package:vsp_logistics/view_models/search_screen_viewmodel/SearchScreenViewModel.dart';

import '../../res/assets/images/image_assets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TextEditingController textController = TextEditingController();
  var textController = Get.put(TextEditingController());
  // List<String> data = [];
  RxBool search = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AnimSearchBar(
                width: MediaQuery.of(context).size.width-16,
                textController: textController,
                color: AppColor.itemColor,
                textFieldColor: AppColor.itemColor,
                onSuffixTap: () {search.value = false;textController.clear();},
                // onChanged: (s){},
                onSubmitted: (String s) {search.value = true;},
              ),
          ),
        ],
      ),
      body: Obx(()=> Column(
        mainAxisAlignment: ( search.value && SearchScreenViewModel.data.isEmpty) ? MainAxisAlignment.center : (!search.value) ? MainAxisAlignment.center :  MainAxisAlignment.start,
        crossAxisAlignment: ( search.value && SearchScreenViewModel.data.isEmpty) ? CrossAxisAlignment.center : (!search.value) ? CrossAxisAlignment.center :  CrossAxisAlignment.start,
        children: [
          Obx(() => Visibility(
            visible: !search.value,
            child:
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset('assets/images/search_image.png',height: 200,width: 200,),
                  const SizedBox(height: 10,),
                  Text('search_w_ladle_no'.tr,style: AppStyles.bigFont.copyWith(color: AppColor.neutral100),),
                  const SizedBox(height: 10,),
                  Text('get_all_details'.tr,style: AppStyles.boldFont.copyWith(color: AppColor.neutral80)),
                ],
              ),
            ),
          ),
          ),

          Obx(() => Visibility(
            visible: search.value && SearchScreenViewModel.data.isEmpty,
            child:
            SizedBox(
              width: double.infinity,
              child: Column(

                children: [
                  Image.asset('assets/images/search_image.png',height: 200,width: 200,),
                  const SizedBox(height: 10,),
                  Text('ladle_not_found'.tr,style: AppStyles.bigFont.copyWith(color: AppColor.neutral100),),
                  const SizedBox(height: 10,),
                  Text('search_w_correct_ladle_no'.tr,style: AppStyles.boldFont.copyWith(color: AppColor.neutral80)),
                ],
              ),
            ),
          ),
          ),

          Obx(() => Visibility(
            visible: search.value && SearchScreenViewModel.data.isNotEmpty,
            child:
            Column(
              children: [
                Text(
                  "${"ladle_bold".tr} ${SearchScreenViewModel.data[0].ladleNumber}",
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
          ),
          ),
        ],
        ),
      ),
    );
  }
}


