import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vsp_logistics/res/assets/images/image_assets.dart';

import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';

import 'package:vsp_logistics/data/providers/language_provider.dart';
import 'package:vsp_logistics/res/localization/locale_type.dart';
import 'package:vsp_logistics/view_models/HistoryScreenViewModel/HistoryScreenViewModel.dart';




class HistoryScreen extends StatefulWidget {
   HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
   final Map lan = {"English": LocaleType.localeOne.toLanguageTag(), "Hindi": LocaleType.localeTwo.toLanguageTag(), "Telugu": LocaleType.localeThree.toLanguageTag()};

   RxBool hasRecord = true.obs;

   RxBool hotMetalDetails = false.obs;

   RxBool hotMetalPitArea = false.obs;

   RxBool hotMetalConverter = false.obs;

   RxBool steelLadleDetails = false.obs;

   RxBool steelLadlePreparationBay = false.obs;

   RxBool steelLadleLF1 = false.obs;

   RxBool steelLadleLF2 = false.obs;

   RxBool steelLadleRH = false.obs;

   RxBool steelLadleCasterMachine = false.obs;

   RxBool scrapLadleDetails = false.obs;

   RxBool scrapLadleConverter = false.obs;

   RxBool scrapLadleDumpingArea = false.obs;

   @override
  void initState() {
     hasRecord = true.obs;
     hotMetalDetails = false.obs;
     hotMetalPitArea = false.obs;
     hotMetalConverter = false.obs;
     steelLadleDetails = false.obs;
     steelLadlePreparationBay = false.obs;
     steelLadleLF1 = false.obs;
     steelLadleLF2 = false.obs;
     steelLadleRH = false.obs;
     steelLadleCasterMachine = false.obs;
     scrapLadleDetails = false.obs;
     scrapLadleConverter = false.obs;
     scrapLadleDumpingArea = false.obs;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      // AppBar(
      //   title: Text("Ladles"),
      // ),
      PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: SafeArea(
          child: Consumer<LanguageProvider>(
            builder: (context, value, child) =>
                EasyDateTimeLine(
                  initialDate: DateTime.now(),
                  locale: value.list.isEmpty? lan["English"] : lan[value.list[0]['language']],
                  onDateChange: (selectedDate) {
                    //`selectedDate` the new date selected.
                  },
                  headerProps: const EasyHeaderProps(
                    monthPickerType: MonthPickerType.switcher,
                    selectedDateFormat: SelectedDateFormat.fullDateDMY,
                  ),
                  dayProps: const EasyDayProps(
                    dayStructure: DayStructure.dayStrDayNum,
                    activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff00CDAC),
                            AppColor.buttonColor,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ),
      body:
      Obx(()=>
          hasRecord.value
          ?
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 80,
                        minWidth: 400,
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.lightColor1,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("hot_metal".tr,style: AppStyles.headingFont.copyWith(color: AppColor.neutral100),),
                                  // Text("ladle_circulation_time".tr,style: AppStyles.cardBoldFont.copyWith(color: AppColor.neutral100),),
                                  // Text(SearchScreenViewModel.data[0].ladleCirculationTimes,style: AppStyles.normalFont.copyWith(color: AppColor.neutral50),),
                                ],
                              ),
                              TextButton(
                                  onPressed: (){
                                    hotMetalDetails.value = !hotMetalDetails.value;
                                  },
                                  child: Obx(()=> Text(
                                      hotMetalDetails.value
                                      ?
                                      "click_to_close".tr
                                          :
                                      "click_to_details".tr,
                                      style: AppStyles.normalFont.copyWith(color:AppColor.buttonColor),),
                                  )
                              ),
                              // Image.asset(ImageAssets.hotMetal,fit: BoxFit.cover,)
                              // Image.asset(ImageAssets.circulationTime),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Obx(()=> Visibility(
                        visible: hotMetalDetails.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(()=> Visibility(
                                visible: hotMetalPitArea.value || (!hotMetalPitArea.value && !hotMetalConverter.value),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: hotMetalPitArea.value ? 300 : 100,

                                      constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                        minHeight: 100,
                                      ),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                      child: Obx(()=> Column(
                                          mainAxisAlignment: hotMetalPitArea.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("TLC pit area",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100)),
                                            Visibility(
                                                visible: hotMetalPitArea.value,
                                                child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                            ),
                                            // Visibility(
                                            //   visible: hotMetalPitArea.value,
                                            //     child: const Text("Ladle Nos"),
                                            // ),
                                            Visibility(
                                                visible: hotMetalPitArea.value,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 5,
                                                    itemBuilder: (context, index) {
                                                      return Text("Ladle No 000${index+1}");
                                                  },),
                                                )
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top:0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: (){
                                            hotMetalPitArea.value = !hotMetalPitArea.value;
                                          },
                                          padding: const  EdgeInsets.all(0.0),
                                          icon:
                                          Obx(()=> hotMetalPitArea.value
                                              ?
                                          const Icon(Icons.remove,size: 20,color:Colors.red)
                                              :
                                          const Icon(Icons.add,size: 20,color:Colors.green),
                                          ),

                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Obx(()=> Visibility(
                                visible: hotMetalConverter.value ||(!hotMetalPitArea.value && !hotMetalConverter.value),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: hotMetalConverter.value ? 300 : 100,

                                      constraints: const  BoxConstraints(
                                        //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                        minHeight: 100,
                                      ),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                      child: Column(
                                        mainAxisAlignment: hotMetalConverter.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Converter",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100)),
                                          Visibility(
                                              visible: hotMetalConverter.value,
                                              child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                          ),
                                          // Visibility(
                                          //   visible: hotMetalPitArea.value,
                                          //     child: const Text("Ladle Nos"),
                                          // ),
                                          Visibility(
                                              visible: hotMetalConverter.value,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: 5,
                                                  itemBuilder: (context, index) {
                                                    return Text("Ladle No 0005");
                                                  },),
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top:0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: (){
                                            hotMetalConverter.value = !hotMetalConverter.value;
                                          },
                                          padding: const  EdgeInsets.all(0.0),
                                          icon:
                                          Obx(()=> hotMetalConverter.value
                                              ?
                                          const Icon(Icons.remove,size: 20,color:Colors.red)
                                              :
                                          const Icon(Icons.add,size: 20,color:Colors.green),
                                          ),

                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 80,
                        minWidth: 400,
                      ),
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
                              Text("steel_ladle".tr,style: AppStyles.headingFont.copyWith(color: AppColor.neutral100),),
                              // Text("ladle_circulation_time".tr,style: AppStyles.cardBoldFont.copyWith(color: AppColor.neutral100),),
                              // Text(SearchScreenViewModel.data[0].ladleCirculationTimes,style: AppStyles.normalFont.copyWith(color: AppColor.neutral50),),
                            ],
                          ),
                          TextButton(
                              onPressed: (){
                                steelLadleDetails.value = !steelLadleDetails.value;
                              },
                              child: Obx(()=> Text(
                                  steelLadleDetails.value
                                      ?
                                  "click_to_close".tr
                                      :
                                  "click_to_details".tr,
                                  style: AppStyles.normalFont.copyWith(color:AppColor.buttonColor),
                                ),
                              )
                          ),
                          // Image.asset(ImageAssets.steelLadle,fit: BoxFit.cover,),
                        ],
                      ),
                    ),
                    Obx(()=> Visibility(
                        visible: steelLadleDetails.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(()=> Visibility(
                              visible: steelLadlePreparationBay.value ||(!steelLadlePreparationBay.value && !steelLadleLF1.value && !steelLadleLF2.value && !steelLadleRH.value && !steelLadleCasterMachine.value),
                              child: Stack(
                                children: [
                                  Container(
                                    width: steelLadlePreparationBay.value ? 300 : 100,
                                    constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                      minHeight: 100,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                    child: Column(
                                      mainAxisAlignment: steelLadlePreparationBay.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Ladle Preparation Bay",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100),textAlign: TextAlign.center,),
                                        Visibility(
                                            visible: steelLadlePreparationBay.value,
                                            child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                        ),
                                        // Visibility(
                                        //   visible: hotMetalPitArea.value,
                                        //     child: const Text("Ladle Nos"),
                                        // ),
                                        Visibility(
                                            visible: steelLadlePreparationBay.value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Text("Ladle No 0005");
                                                },),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top:0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          steelLadlePreparationBay.value = !steelLadlePreparationBay.value;
                                        },
                                        padding: const  EdgeInsets.all(0.0),
                                        icon:
                                        Obx(()=> steelLadlePreparationBay.value
                                            ?
                                        const Icon(Icons.remove,size: 20,color:Colors.red)
                                            :
                                        const Icon(Icons.add,size: 20,color:Colors.green),
                                        ),

                                      )
                                  ),
                                ],
                              ),
                            ),
                            ),
                            const SizedBox(width: 10,),
                            Obx(()=> Visibility(
                              visible: steelLadleLF1.value ||(!steelLadlePreparationBay.value && !steelLadleLF1.value && !steelLadleLF2.value && !steelLadleRH.value && !steelLadleCasterMachine.value),
                              child: Stack(
                                children: [
                                  Container(
                                    width: steelLadleLF1.value ? 300 : 100,
                                    constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                      minHeight: 100,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                    child: Column(
                                      mainAxisAlignment: steelLadleLF1.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("LF-1",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100),textAlign: TextAlign.center,),
                                        Visibility(
                                            visible: steelLadleLF1.value,
                                            child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                        ),
                                        // Visibility(
                                        //   visible: hotMetalPitArea.value,
                                        //     child: const Text("Ladle Nos"),
                                        // ),
                                        Visibility(
                                            visible: steelLadleLF1.value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Text("Ladle No 0005");
                                                },),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top:0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          steelLadleLF1.value = !steelLadleLF1.value;
                                        },
                                        padding: const  EdgeInsets.all(0.0),
                                        icon:
                                        Obx(()=> steelLadleLF1.value
                                            ?
                                        const Icon(Icons.remove,size: 20,color:Colors.red)
                                            :
                                        const Icon(Icons.add,size: 20,color:Colors.green),
                                        ),

                                      )
                                  ),
                                ],
                              ),
                            ),
                            ),
                            const SizedBox(width: 10,),
                            Obx(()=> Visibility(
                              visible: steelLadleLF2.value ||(!steelLadlePreparationBay.value && !steelLadleLF1.value && !steelLadleLF2.value && !steelLadleRH.value && !steelLadleCasterMachine.value),
                              child: Stack(
                                children: [
                                  Container(
                                    width: steelLadleLF2.value ? 300 : 100,
                                    constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                      minHeight: 100,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                    child: Column(
                                      mainAxisAlignment: steelLadleLF2.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("LF-2",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100),textAlign: TextAlign.center,),
                                        Visibility(
                                            visible: steelLadleLF2.value,
                                            child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                        ),
                                        // Visibility(
                                        //   visible: hotMetalPitArea.value,
                                        //     child: const Text("Ladle Nos"),
                                        // ),
                                        Visibility(
                                            visible: steelLadleLF2.value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Text("Ladle No 0005");
                                                },),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top:0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          steelLadleLF2.value = !steelLadleLF2.value;
                                        },
                                        padding: const  EdgeInsets.all(0.0),
                                        icon:
                                        Obx(()=> steelLadleLF2.value
                                            ?
                                        const Icon(Icons.remove,size: 20,color:Colors.red)
                                            :
                                        const Icon(Icons.add,size: 20,color:Colors.green),
                                        ),

                                      )
                                  ),
                                ],
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(()=> Visibility(visible: steelLadleDetails.value, child: const SizedBox(height: 10,))),
                    Obx(()=> Visibility(
                        visible: steelLadleDetails.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(()=> Visibility(
                              visible: steelLadleRH.value ||(!steelLadlePreparationBay.value && !steelLadleLF1.value && !steelLadleLF2.value && !steelLadleRH.value && !steelLadleCasterMachine.value),
                              child: Stack(
                                children: [
                                  Container(
                                    width: steelLadleRH.value ? 300 : 100,
                                    constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                      minHeight: 100,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                    child: Column(
                                      mainAxisAlignment: steelLadleRH.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("RH",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100),textAlign: TextAlign.center,),
                                        Visibility(
                                            visible: steelLadleRH.value,
                                            child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                        ),
                                        // Visibility(
                                        //   visible: hotMetalPitArea.value,
                                        //     child: const Text("Ladle Nos"),
                                        // ),
                                        Visibility(
                                            visible: steelLadleRH.value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Text("Ladle No 0005");
                                                },),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top:0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          steelLadleRH.value = !steelLadleRH.value;
                                        },
                                        padding: const  EdgeInsets.all(0.0),
                                        icon:
                                        Obx(()=> steelLadleRH.value
                                            ?
                                        const Icon(Icons.remove,size: 20,color:Colors.red)
                                            :
                                        const Icon(Icons.add,size: 20,color:Colors.green),
                                        ),

                                      )
                                  ),
                                ],
                              ),
                            ),
                            ),
                            const SizedBox(width: 10,),
                            Obx(()=> Visibility(
                              visible: steelLadleCasterMachine.value ||(!steelLadlePreparationBay.value && !steelLadleLF1.value && !steelLadleLF2.value && !steelLadleRH.value && !steelLadleCasterMachine.value),
                              child: Stack(
                                children: [
                                  Container(
                                    width: steelLadleCasterMachine.value ? 300 : 100,
                                    constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                      minHeight: 100,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                    child: Column(
                                      mainAxisAlignment: steelLadleCasterMachine.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Caster Machines",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100),textAlign: TextAlign.center,),
                                        Visibility(
                                            visible: steelLadleCasterMachine.value,
                                            child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                        ),
                                        // Visibility(
                                        //   visible: hotMetalPitArea.value,
                                        //     child: const Text("Ladle Nos"),
                                        // ),
                                        Visibility(
                                            visible: steelLadleCasterMachine.value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Text("Ladle No 0005");
                                                },),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top:0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          steelLadleCasterMachine.value = !steelLadleCasterMachine.value;
                                        },
                                        padding: const  EdgeInsets.all(0.0),
                                        icon:
                                        Obx(()=> steelLadleCasterMachine.value
                                            ?
                                        const Icon(Icons.remove,size: 20,color:Colors.red)
                                            :
                                        const Icon(Icons.add,size: 20,color:Colors.green),
                                        ),

                                      )
                                  ),
                                ],
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      // height: 100,
                      // width: 400,
                      constraints: const BoxConstraints(
                        minHeight: 80,
                        minWidth: 400,
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.lightColor1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("scrap_pot".tr,style: AppStyles.headingFont.copyWith(color: AppColor.neutral100),),
                          // Image.asset(ImageAssets.scrapPot,fit: BoxFit.cover,),
                          TextButton(
                              onPressed: (){
                                scrapLadleDetails.value = !scrapLadleDetails.value;
                              },
                              child: Obx(()=> Text(
                                  scrapLadleDetails.value
                                      ?
                                  "click_to_close".tr
                                      :
                                  "click_to_details".tr,
                                  style: AppStyles.normalFont.copyWith(color:AppColor.buttonColor),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Obx(()=> Visibility(
                        visible: scrapLadleDetails.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(()=> Visibility(
                              visible: scrapLadleConverter.value || (!scrapLadleConverter.value && !scrapLadleDumpingArea.value),
                              child: Stack(
                                children: [
                                  Container(
                                    width: scrapLadleConverter.value ? 300 : 100,
                                    constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                      minHeight: 100,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                    child: Column(
                                      mainAxisAlignment: scrapLadleConverter.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Converter",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100),textAlign: TextAlign.center,),
                                        Visibility(
                                            visible: scrapLadleConverter.value,
                                            child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                        ),
                                        // Visibility(
                                        //   visible: hotMetalPitArea.value,
                                        //     child: const Text("Ladle Nos"),
                                        // ),
                                        Visibility(
                                            visible: scrapLadleConverter.value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Text("Ladle No 0005");
                                                },),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top:0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          scrapLadleConverter.value = !scrapLadleConverter.value;
                                        },
                                        padding: const  EdgeInsets.all(0.0),
                                        icon:
                                        Obx(()=> scrapLadleConverter.value
                                            ?
                                        const Icon(Icons.remove,size: 20,color:Colors.red)
                                            :
                                        const Icon(Icons.add,size: 20,color:Colors.green),
                                        ),

                                      )
                                  ),
                                ],
                              ),
                            ),
                            ),
                            const SizedBox(width: 10,),
                            Obx(()=> Visibility(
                              visible: scrapLadleDumpingArea.value || (!scrapLadleConverter.value && !scrapLadleDumpingArea.value),
                              child: Stack(
                                children: [
                                  Container(
                                    width: scrapLadleDumpingArea.value ? 300 : 100,
                                    constraints: const  BoxConstraints(
                                      //   minWidth: hotMetalPitArea.value ? 300 : 100,
                                      minHeight: 100,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: AppColor.itemColor,),
                                    child: Column(
                                      mainAxisAlignment: scrapLadleDumpingArea.value ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Dumping Area",style:AppStyles.headingFont.copyWith(color: AppColor.neutral100),textAlign: TextAlign.center,),
                                        Visibility(
                                            visible: scrapLadleDumpingArea.value,
                                            child: Text("Ladle Count - ${HistoryScreenViewModel.ladleCount}",style:AppStyles.normalFont.copyWith(color: AppColor.neutral100))
                                        ),
                                        // Visibility(
                                        //   visible: hotMetalPitArea.value,
                                        //     child: const Text("Ladle Nos"),
                                        // ),
                                        Visibility(
                                            visible: scrapLadleDumpingArea.value,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Text("Ladle No 0005");
                                                },),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top:0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: (){
                                          scrapLadleDumpingArea.value = !scrapLadleDumpingArea.value;
                                        },
                                        padding: const  EdgeInsets.all(0.0),
                                        icon:
                                        Obx(()=> scrapLadleDumpingArea.value
                                            ?
                                        const Icon(Icons.remove,size: 20,color:Colors.red)
                                            :
                                        const Icon(Icons.add,size: 20,color:Colors.green),
                                        ),

                                      )
                                  ),
                                ],
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
          :
          SizedBox(
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.noRecordsFound,height: 200,width: 200,),
                Text('no_records'.tr),
              ],
            ),
        ),
      ),
    );
  }
}
