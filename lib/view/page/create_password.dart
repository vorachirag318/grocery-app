import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/password_visiblility_controller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/view/page/main_dashboard.dart';
import 'package:grocery_app/view/widget/common_button.dart';
import 'package:grocery_app/view/widget/common_logo.dart';
class CreatePassword extends StatelessWidget {
  final PasswordVisibilityController passwordVisibilityController =
      Get.put(PasswordVisibilityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                        "Set your password to get start.",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.textColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Create your Password",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Password",
                        style:
                            TextStyle(fontSize: 16, color: AppColors.textColor),
                      ),
                    ),
                    Obx(() => Container(
                          height: 50,
                          width: double.infinity,
                          child: TextFormField(
                            obscureText:
                                passwordVisibilityController.showpassword.value,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      passwordVisibilityController
                                              .showpassword.value =
                                          !passwordVisibilityController
                                              .showpassword.value;
                                    },
                                    icon: passwordVisibilityController
                                            .showpassword.value
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility)),
                                border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: AppColors.appColors, width: 1),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonButton(
                      name: "NEXT",
                      voidCallback: () {
                        Get.to(MainDashBoard());
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
