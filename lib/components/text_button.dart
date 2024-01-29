import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';

import '../res/colors/app_color.dart';
import 'AlertDialog.dart';

class CustomTextButton extends StatefulWidget {
  CustomTextButton({
    Key? key,
    this.buttonColor = AppColor.buttonColor,
    this.textColor = AppColor.neutral10,
    this.onTapButtonColor = AppColor.lightColor2,
    // this.loading = false,
    this.width = 300,
    this.height = 50,
    this.radius = 10,
    required this.onPress,
    required this.title,
  }) : super(key: key);

  final String title;
  final double height, width, radius;
  final Function onPress;
  final Color textColor, buttonColor, onTapButtonColor;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  final RxBool loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        loading.value = true;
        try{
          widget.onPress();
              // .then((value) => loading.value = false);
        }catch(e){
          AlertBox().showAlert(context, 'Error', e.toString());
        }finally{
          loading.value = false;
        }
      },
      child: Obx(()=>Container(
          height: widget.height,
          width: widget.width,
          decoration: loading.value
          ?
          BoxDecoration(
            color: widget.onTapButtonColor,
            borderRadius: BorderRadius.circular(widget.radius),
          )
            :
          BoxDecoration(
            color:  widget.buttonColor,
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: Obx(()=> loading.value ?
              const Center(child: CircularProgressIndicator()) :
              Center(child: Text(widget.title, style: AppStyles.buttonTextFont.copyWith(color: widget.textColor),)),
          )
        ),
      ),
    );
  }
}
