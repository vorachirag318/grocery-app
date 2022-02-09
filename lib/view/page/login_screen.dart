import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/utils/config/app_images.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/page/main_dashboard.dart';
import 'package:grocery_app/view/page/password_screen.dart';
import 'package:grocery_app/view/widget/common_button.dart';
import 'package:grocery_app/view/widget/common_logo.dart';
import 'package:grocery_app/view/widget/common_textfiled.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(right: -100, top: -50, child: Commonlogo()),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(AppIcons.backarrowIcon)),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Use Language in English",
                            style: TextStyle(fontSize: 12),
                          ),
                          Icon(Icons.expand_more),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.offAll(MainDashBoard());
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Text(
                        "Login or create a New Account",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.textColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Enter Email Address",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Email Address",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.textColor),
                      ),
                    ),
                    CommonTextFiled(),
                    SizedBox(
                      height: 10,
                    ),
                    CommonButton(
                      name: "LOGIN",
                      voidCallback: () {
                        Get.to(PasswordScreen());
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.google),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Sign up Google")
                          ],
                        ),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.appColors, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
