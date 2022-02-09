import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/utils/config/device_size.dart';

class AppBarBack extends StatelessWidget {
  final String? title;

  const AppBarBack({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        color: AppColors.appColors,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getScreenHeight(35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      child: Image.asset(
                        AppIcons.backarrowIcon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    title.toString(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
