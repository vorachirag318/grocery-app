import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/welcome_screen_controller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';

import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/page/login_screen.dart';
import 'package:grocery_app/view/page/main_dashboard.dart';

class WelcomeScreen extends StatelessWidget {
  final WelcomeScreenContoller welcomeScreenContoller =
      Get.put(WelcomeScreenContoller());

  SwiperController swiperController = SwiperController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFD4FFC9), Color(0xFFFFFFFF)],
          ),
        ),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: getScreenHeight(100),
            ),
            Container(
              height: getScreenHeight(295),
              width: SizeConfig.screenWidth,
              child: Swiper(
                onIndexChanged: (value) {
                  welcomeScreenContoller.isSelected.value = value;
                },
                itemCount: welcomeScreenContoller.welcomeScreenList.length,
                // autoplay: true,
                controller: swiperController,
                itemBuilder: (conext, index) {
                  return Container(
                    child: Image.asset(welcomeScreenContoller
                        .welcomeScreenList[index]["image"]),
                  );
                },
              ),
            ),
            SizedBox(
              height: getScreenHeight(50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedCircle(0),
                SizedBox(
                  width: 5,
                ),
                selectedCircle(1),
                SizedBox(
                  width: 5,
                ),
                selectedCircle(2)
              ],
            ),
            SizedBox(
              height: getScreenHeight(50),
            ),
            Container(
                width: SizeConfig.screenWidth,
                height: getScreenHeight(150),
                child: Swiper(
                    onIndexChanged: (value) {
                      welcomeScreenContoller.isSelected.value = value;
                    },
                    controller: swiperController,
                    autoplay: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            welcomeScreenContoller.welcomeScreenList[index]
                                    ["title"]
                                .toString(),
                            style: TextStyle(
                                fontSize: getScreenHeight(22),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: getScreenHeight(30),
                          ),
                          Text(
                            welcomeScreenContoller.welcomeScreenList[index]
                                    ["labal1"]
                                .toString(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: getScreenHeight(10),
                          ),
                          Text(
                            welcomeScreenContoller.welcomeScreenList[index]
                                    ["label2"]
                                .toString(),
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount:
                        welcomeScreenContoller.welcomeScreenList.length)),
            GestureDetector(
              onTap: () {
                Get.offAll(LoginScreen());
              },
              child: Container(
                width: getScreenWidth(262),
                height: getScreenHeight(52),
                color: AppColors.appColors,
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getScreenHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(MainDashBoard());
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: getScreenWidth(25),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget selectedCircle(index) {
    return Obx(
      () => Container(
        height: getScreenHeight(12),
        width: getScreenWidth(12),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: welcomeScreenContoller.isSelected.value == index
                ? AppColors.appColors
                : Colors.white),
      ),
    );
  }
}
