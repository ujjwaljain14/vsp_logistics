import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.labelText,
    this.height = 50,
    this.width = 280,
    this.borderRadius = 10,
    this.color = AppColor.lightColor2,
    this.focusColor = AppColor.lightColor1,
    this.prefixText='',
    this.keyboard = TextInputType.text,
    this.function,
    this.behavior = FloatingLabelBehavior.auto,
  }) : super(key: key);

  final TextEditingController controller;
  final double height, width, borderRadius;
  final Color color, focusColor;
  final String labelText;
  final Icon icon;
  final String prefixText;
  final TextInputType keyboard;
  final VoidCallback? function;
  final FloatingLabelBehavior behavior;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        onChanged: (s){
          function!();
        },
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          fillColor: color,
          focusColor: focusColor,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(width: 10, style: BorderStyle.none,color: focusColor)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(width: 10, style: BorderStyle.none,color: focusColor)),
          filled: true,
            prefixIcon: icon,
            floatingLabelBehavior: behavior,
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.black),
            prefixText: prefixText,
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),
            //     borderSide: const BorderSide(width: 10, style: BorderStyle.none))

        ),
      ),
    );
  }
}
