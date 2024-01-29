import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';

import '../../components/text_button.dart';
import '../../components/text_field.dart';
import '../../res/assets/images/image_assets.dart';
import '../../res/routes/routes_name.dart';
import '../home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController idController = TextEditingController();
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
                        icon: const Icon(Icons.email,),
                        labelText: "User Id",
                        function: () {},
                      ),
                      const SizedBox(height: 30),
                      // const Text("Password", style: TextStyle(color: AppColor.neutral80),),
                      CustomTextField(
                        controller: passwordController,
                        icon: const Icon(Icons.lock),
                        labelText: "Password",
                        function: () {},
                      ),
                      const SizedBox(height: 50),
                      CustomTextButton(
                        title: "Login",
                        onPress: () {
                          // Get.to(() => const Home());
                          Get.offAllNamed(RoutesName.bottomNavigation);
                        },
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Don't have an account?",style: AppStyles.normalFont.copyWith(color: AppColor.neutral50)),
                          InkWell(
                              onTap:(){
                                Get.toNamed(RoutesName.signUpScreen);
                              },
                              child: Text("Sign Up",style: AppStyles.normalFont.copyWith(color: AppColor.buttonColor))
                          ),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
