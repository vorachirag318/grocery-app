import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/dashboard_controller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/utils/config/app_images.dart';
import 'package:grocery_app/utils/config/device_size.dart';

class Home extends StatelessWidget {
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Container(
                height: getScreenHeight(181),
                width: getScreenWidth(380),
                child: Image.asset(
                  AppImages.banner,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: getScreenHeight(50),
                width: SizeConfig.screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Image.asset(AppIcons.truck),
                      Spacer(),
                      Text(
                        "FRIDAY : Tomorrow, 7:00 AM-10:00 PM",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 10, color: Colors.grey.shade300)
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => Column(
                    children: [
                      Container(
                        height: getScreenHeight(50),
                        width: getScreenWidth(50),
                        child: Image.asset(
                            dashBoardController.itemsdetails[index]["image"]),
                        decoration: BoxDecoration(
                          color: dashBoardController.itemsdetails[index]
                              ["Color"],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          dashBoardController.itemsdetails[index]["name"],
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Popular products",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Wrap(
                spacing: 15,
                children: List.generate(2, (index) {
                  return Container(
                    height: getScreenHeight(178),
                    width: getScreenWidth(160),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Image.asset(AppImages.vegetable1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        "Fresh Apple",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2),
                                      child: Text(
                                        "1 kg",
                                        style: TextStyle(fontSize: 8),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1),
                                      child: Text(
                                        "₹20",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: getScreenHeight(26),
                                  width: getScreenWidth(26),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColors.appColors,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
