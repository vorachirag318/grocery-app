import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/view/page/create_password.dart';
import 'package:grocery_app/view/widget/common_button.dart';
import 'package:grocery_app/view/widget/common_logo.dart';
import 'package:grocery_app/view/widget/common_textfiled.dart';

class FullNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(AppIcons.backarrowIcon)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Text(
                        "Tell us about yourself !",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.textColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "What is your full Name?",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Full Name",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.textColor),
                      ),
                    ),
                    CommonTextFiled(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonButton(
                      name: "NEXT",
                      voidCallback: () {
                        Get.to(CreatePassword());
                      },
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
