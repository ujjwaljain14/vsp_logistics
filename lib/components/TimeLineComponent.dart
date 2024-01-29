import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';

class TimeLineComponent extends StatefulWidget {
  const TimeLineComponent({Key? key, required this.data}) : super(key: key);

  final List data;
  @override
  State<TimeLineComponent> createState() => _TimeLineComponentState();
}

class _TimeLineComponentState extends State<TimeLineComponent> {
  var timer;
  int count=0;
  @override
  void initState() {
    timer = Timer(const Duration(seconds: 5), () {
      if(count < widget.data.length/2){
        widget.data[count].toLadleCount = (int.parse(widget.data[count].toLadleCount)+1).toString();
      }else{
        widget.data[widget.data.length - count].froLadleCount = (int.parse(widget.data[widget.data.length - count].toLadleCount)+1).toString();
      }
      count++;
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length  ,
      itemBuilder: (context, index) {
        return Column(
          children: [
              SizedBox(
                width: 300,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.data[index].stageName,style:AppStyles.headingFont.copyWith(color: AppColor.neutral100)),
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: double.parse(widget.data[index].efficiency) >= 0
                                    ?
                                Colors.green.withOpacity(0.4)
                                :
                                Colors.red.withOpacity(0.4)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  double.parse(widget.data[index].efficiency) >= 0
                                  ?
                                  "${widget.data[index].efficiency}%${"mtavg".tr}"
                                  :
                                  "${double.parse(widget.data[index].efficiency)*-1}%${"ltavg".tr}",
                                  style: AppStyles.smallFont.copyWith(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text("${int.parse(widget.data[index].toLadleCount) + int.parse(widget.data[index].froLadleCount)} ${"ladles_passed".tr}",style: AppStyles.normalFont.copyWith(color: AppColor.neutral80),),
                        const SizedBox(height: 10),
                        Text("${"last_updated".tr} ${widget.data[index].lastUpdate} ",style: AppStyles.smallFont.copyWith(color: AppColor.neutral50),),
                      ],
                    ),
                  ),
                ),
              ),
            Visibility(
              visible: index != widget.data.length - 1,
              child: SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(index == widget.data.length - 1 ? "" : "${int.parse(widget.data[index+1].toLadleCount) - int.parse(widget.data[index].toLadleCount)} ${"ladles_transitions".tr}.",style: AppStyles.smallFont.copyWith(color: AppColor.neutral50),textAlign: TextAlign.center,),
                    Column(
                      children: [
                        Container(height: 50, width: 1,color:Colors.black),
                        const Icon(Icons.arrow_drop_down_outlined,),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.arrow_drop_up_outlined,),
                        Container(height: 50, width: 1,color:Colors.black),
                      ],
                    ),
                    Text(index == widget.data.length - 1 ? "" : "${int.parse(widget.data[index].froLadleCount)  - int.parse(widget.data[index+1].froLadleCount)} ${"ladles_transitions".tr}",style: AppStyles.smallFont.copyWith(color: AppColor.neutral50),textAlign: TextAlign.center),
                  ],
                ),
              ),
            )
          ],
        );
    },);
  }
}
