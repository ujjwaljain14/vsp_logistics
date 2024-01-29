import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/components/card_item.dart';
import 'package:vsp_logistics/components/text_button.dart';
import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';
import 'package:vsp_logistics/res/assets/images/image_assets.dart';
import 'package:intl/intl.dart';
import 'package:vsp_logistics/res/localization/locale_type.dart';
import 'package:vsp_logistics/res/routes/routes_name.dart';
import 'package:vsp_logistics/view/home_screens/HotMetalScreen.dart';
// import 'package:provider/provider.dart';
// import '../../data/network/providers/language_provider.dart';
import '../../res/colors/app_color.dart';


// Get.toNamed(RoutesName.pastBillsScreen);


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final month = {
    1:'Jan'.tr, 2:'Feb'.tr, 3:'Mar'.tr, 4:'Apr'.tr, 5:'May'.tr, 6:'June'.tr, 7:'July'.tr, 8:'Aug'.tr,
    9:'Sept'.tr, 10:'Oct'.tr, 11:'Nov'.tr, 12:'Dec'.tr,
  };
  final weekDay = {
    1:'Monday'.tr, 2:'Tuesday'.tr, 3:'Wednesday'.tr, 4:'Thursday'.tr, 5:'Friday'.tr, 6:'Saturday'.tr, 7:'Sunday'.tr,
  };
  final val = 1.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: SafeArea(
          child: Stack(
            children: [
              Image.asset(ImageAssets.headerImg1,fit: BoxFit.cover,height: 200,width: double.infinity,),
              Positioned(
                  top: 8,
                  left: 10,
                  child:
                  Container(
                  // color:AppColor.lightColor1.withOpacity(0.2),
                    child: Text("${DateTime.now().day} ${month[DateTime.now().month]}, ${DateTime.now().year}\n${weekDay[DateTime.now().weekday]}",style: AppStyles.bigFont.copyWith(color: AppColor.blackColor,)))),
              // Positioned(
              //     bottom: 60,
              //     left: 10,width: MediaQuery.of(context).size.width-20,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           color: AppColor.lightColor2.withOpacity(0.2),
              //           padding: const EdgeInsets.all(5),
              //           // height: 50,
              //           width: 120 < MediaQuery.of(context).size.width/4 ? 120 :  MediaQuery.of(context).size.width /4 ,
              //           child: Text(
              //             "Operational Efficiency\n 100",
              //             style: AppStyles.boldFont.copyWith(color: AppColor.backgroundColor),
              //           )
              //         ),
              //         Container(
              //             // color: AppColor.lightColor1,
              //             padding: const EdgeInsets.all(5),
              //             // height: 50,
              //             width: 120 < MediaQuery.of(context).size.width/4 ? 120 :  MediaQuery.of(context).size.width /4 ,
              //             child: Text(
              //               "TurnAround Time\n50",
              //               style: AppStyles.boldFont.copyWith(color: AppColor.backgroundColor),
              //             )
              //         ),
              //         Container(
              //             // color: AppColor.buttonColor,
              //             padding: const EdgeInsets.all(5),
              //             // height: 50,
              //             width: 120 < MediaQuery.of(context).size.width/4 ? 120 :  MediaQuery.of(context).size.width /4 ,
              //             child: Text(
              //               "Operational Efficiency\n 100",
              //               style: AppStyles.boldFont.copyWith(color: AppColor.backgroundColor),
              //             )
              //         ),
              //       ],
              //     ),
              // ),
              Positioned(bottom: 20,left: 10,child: Text("op_efficiency".tr,style: AppStyles.headingFont.copyWith(color: AppColor.neutral100),)),
              Positioned(
                  bottom: 8,
                  left: 10,
                  child: Text(
                    val >= 0
                    ?
                    "$val% ${"mtavg".tr}"
                    :
                    "$val% ${"ltavg".tr}",
                    style: AppStyles.smallFont.copyWith(color: AppColor.neutral60),
                  )
              )
            ],
          )
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        controller: ScrollController(),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text("tracking_details".tr,style: AppStyles.bigFont.copyWith(color: AppColor.neutral100),),
            const SizedBox(height: 10,),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),color: AppColor.lightColor1,),
                      height: 80,
                      width: double.infinity,
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("hot_metal".tr,style: AppStyles.headingFont.copyWith(color: AppColor.neutral100),),
                            Text(
                              val >= 0
                                  ?
                              "${"processed".tr} $val% ${"mtavg".tr}"
                                  :
                              "${"processed".tr} $val% ${"ltavg".tr}",
                              style: AppStyles.normalFont.copyWith(color: AppColor.neutral90),
                            ),
                            Text("${"last_updated_on".tr}: ${DateFormat.Hms().format(DateTime.now())}",style: AppStyles.smallFont.copyWith(color: AppColor.neutral50),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),color: AppColor.buttonColor.withOpacity(0.1),),
                      height: 50,
                      width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: CustomTextButton(
                                  onPress: (){
                                    Get.toNamed(RoutesName.hotMetalScreen);
                                    },
                                  title: "Details".tr,width: 70,height: 30,
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text("100 ${"hot_metal".tr} ${"processed".tr}",style: AppStyles.smallFont.copyWith(color: AppColor.neutral60),),
                            ),
                          ],
                        )
                    )
                  ],
                ),
                Positioned(bottom: 10, right: 10, child: SizedBox(height:80,width:100,child: Image.asset(ImageAssets.hotMetal,fit: BoxFit.cover))),
              ],
            ),
            const SizedBox(height: 10,),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),color: AppColor.lightColor1,),
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("steel_ladle".tr,style: AppStyles.headingFont.copyWith(color: AppColor.neutral100),),
                            Text(
                              val >= 0
                                  ?
                              "${"processed".tr} $val% ${"mtavg".tr}"
                                  :
                              "${"processed".tr} $val% ${"ltavg".tr}",
                              style: AppStyles.normalFont.copyWith(color: AppColor.neutral90),
                            ),
                            Text("${"last_updated_on".tr}: ${DateFormat.Hms().format(DateTime.now())}",style: AppStyles.smallFont.copyWith(color: AppColor.neutral50),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),color: AppColor.buttonColor.withOpacity(0.1),),
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: CustomTextButton(
                              onPress: (){
                                Get.toNamed(RoutesName.steelLadleScreen);
                              },
                              title: "Details".tr,width: 70,height: 30,)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("100 ${"hot_metal".tr} ${"processed".tr}",style: AppStyles.smallFont.copyWith(color: AppColor.neutral60),),
                          ),
                        ],
                      )
                    )
                  ],
                ),
                Positioned(bottom: 10, right: 10, child: SizedBox(height:70,width:100,child: Image.asset(ImageAssets.steelLadle,fit: BoxFit.cover,))),
              ],
            ),
            const SizedBox(height: 10,),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),color: AppColor.lightColor1,),
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("scrap_pot".tr,style: AppStyles.headingFont.copyWith(color: AppColor.neutral100),),
                            Text(
                              val >= 0
                                  ?
                              "${"processed".tr} $val% ${"mtavg".tr}"
                                  :
                              "${"processed".tr} $val% ${"ltavg".tr}",
                              style: AppStyles.normalFont.copyWith(color: AppColor.neutral90),
                            ),
                            Text("${"last_updated_on".tr}: ${DateFormat.Hms().format(DateTime.now())}",style: AppStyles.smallFont.copyWith(color: AppColor.neutral50),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),color: AppColor.buttonColor.withOpacity(0.1),),
                      height: 50,
                      width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: CustomTextButton(
                                  onPress: (){
                                    Get.toNamed(RoutesName.scrapPotScreen);
                                  },
                                  title: "Details".tr,width: 70,height: 30,
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text("100 ${"scrap_pot".tr} ${"processed".tr}",style: AppStyles.smallFont.copyWith(color: AppColor.neutral60),),
                            ),
                          ],
                        )
                    )
                  ],
                ),
                Positioned(bottom: 10, right: 10, child: SizedBox(height:80,width:100, child: Image.asset(ImageAssets.scrapPot,fit: BoxFit.cover,))),
              ],
            ),
            // )
          ],
        ),
      )
    );
  }
}
