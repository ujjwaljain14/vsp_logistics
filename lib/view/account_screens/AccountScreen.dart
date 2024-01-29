import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:vsp_logistics/res/assets/fonts/app_fonts.dart';
import 'package:vsp_logistics/res/colors/app_color.dart';

import '../../res/routes/routes_name.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("profile".tr, style: AppStyles.headingFont,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
                    ],
                  ),
                  const SizedBox(height: 30),
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.lightColor2,
                        backgroundImage: AssetImage("assets/images/profile.png"),
                      ),
                      Positioned(
                        bottom: 10,
                          right: 23,
                          child: Container(
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.lightColor1.withOpacity(0.4),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Text("change".tr),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("Your Name",style: AppStyles.boldFont,),
                  const SizedBox(height: 5),
                  Text("email@gmail.com",style: AppStyles.smallFont.copyWith(color: Colors.grey),),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("application".tr,style: AppStyles.boldFont.copyWith(color:Colors.grey)),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    color: AppColor.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(height:30,width:30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColor.lightColor1),child: const Icon(Icons.key,color: Colors.blue,)),
                                  const SizedBox(width: 10),
                                  Text("change_password".tr,style: AppStyles.normalFont.copyWith(color: AppColor.colorBlack),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios,size: 15,),
                            ],
                          ),
                          const SizedBox(height: 15,),
                          InkWell(
                            onTap: (){
                              Get.toNamed(RoutesName.languageChangeScreen);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(height:30,width:30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColor.lightColor1),child: const Icon(Icons.sort_by_alpha,color: Colors.yellow,)),
                                    const SizedBox(width: 10),
                                    Text("language".tr,style: AppStyles.normalFont.copyWith(color: AppColor.colorBlack),),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward_ios,size: 15,),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(height:30,width:30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColor.lightColor1),child: const Icon(Icons.light_mode,color: Colors.grey,)),
                                  const SizedBox(width: 10),
                                  Text("appearance".tr,style: AppStyles.normalFont.copyWith(color: AppColor.colorBlack),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios,size: 15,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("general".tr,style: AppStyles.boldFont.copyWith(color:Colors.grey)),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    color: AppColor.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("tnc".tr,style: AppStyles.normalFont.copyWith(color: AppColor.colorBlack),),
                              const Icon(Icons.arrow_forward_ios,size: 15,),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("privacy_policy".tr,style: AppStyles.normalFont.copyWith(color: AppColor.colorBlack),),
                              const Icon(Icons.arrow_forward_ios,size: 15,),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("support".tr,style: AppStyles.normalFont.copyWith(color: AppColor.colorBlack),),
                              const Icon(Icons.arrow_forward_ios,size: 15,),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("contact".tr,style: AppStyles.normalFont.copyWith(color: AppColor.colorBlack),),
                              const Icon(Icons.arrow_forward_ios,size: 15,),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(onPressed: (){}, child: Text("logout".tr,style: AppStyles.buttonTextFont.copyWith(color:AppColor.dangerMain),)),
                  const SizedBox(height: 10),
                  Text("${"app_version".tr} 1.0.0",style: AppStyles.headingFont.copyWith(color: Colors.grey),),
                ],
          ),
        )
      ),
      )
    );
  }
}

// Container(
// height: 150,
// width: 150,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(50),
// ),
// child: _selectedImage == null
// ?
// LoggedInUserModel.profileImage == null
// ?
// CircleAvatar(
// backgroundImage: AssetImage( "assets/profi.png"),
// )
//     :
// CachedImage(
// LoggedInUserModel.profileImage!,
// (context, imageProvider) => Container(
// // width: 73.0,
// // height: 73.0,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// image: DecorationImage(
// image: imageProvider,
// fit: BoxFit.cover,
// ),
// ),
// ),
// )
// // CircleAvatar(
// //   backgroundImage: NetworkImage(LoggedInUserModel.profileImage!),
// // )
//     :
// CircleAvatar(
// backgroundImage: FileImage(_selectedImage!),
// )
//
// ),