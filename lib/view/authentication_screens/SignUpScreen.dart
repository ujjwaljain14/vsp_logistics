import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';

import '../../components/text_button.dart';
import '../../components/text_field.dart';
import '../../res/assets/images/image_assets.dart';
import '../../res/routes/routes_name.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(height: 60),
                Container(
                    height: 350,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Image.asset(ImageAssets.logo, height: 200, width: 200)
                ),
                // const SizedBox(height: 60),
                // const Text("User Id", style: TextStyle(color: AppColor.neutral80),),
                CustomTextField(
                  controller: idController,
                  icon: const Icon(Icons.person,),
                  labelText: "User Id",
                  function: () {},
                ),
                const SizedBox(height: 30),
                // const Text("Password", style: TextStyle(color: AppColor.neutral80),),
                CustomTextField(
                  controller: emailController,
                  icon: const Icon(Icons.email,),
                  labelText: "Email",
                  function: () {},
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  controller: passwordController,
                  icon: const Icon(Icons.lock),
                  labelText: "Password",
                  function: () {},
                ),
                const SizedBox(height: 50),
                CustomTextButton(
                  title: "Sign Up",
                  onPress: () {
                    Get.offAllNamed(RoutesName.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
