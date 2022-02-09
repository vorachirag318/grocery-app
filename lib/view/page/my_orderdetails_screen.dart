import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/basket_controller.dart';
import 'package:grocery_app/controller/auth/fruites_vegetable_contoller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/utils/config/app_images.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/widget/appbarback.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  final BasketController basketController = Get.put(BasketController());
  final FruitesVegetableController fruitesVegetableController =
      Get.put(FruitesVegetableController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          getScreenHeight(98),
        ),
        child: AppBarBack(
          title: "My Order",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("OrderID : GAORDER740",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text(
                    "Jun10 , 2020",
                    style: TextStyle(color: Colors.grey.shade600),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Micra solution",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Image.asset(AppIcons.location),
                          SizedBox(
                            width: 4,
                          ),
                          Text("201,Micra solution yogichowk")
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Image.asset(AppIcons.phone),
                          SizedBox(
                            width: 4,
                          ),
                          Text("7359529528")
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: getScreenHeight(35),
                    width: getScreenWidth(100),
                    child: Center(
                      child: Text(
                        "Completed",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.appColors,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Divider(
                thickness: 1,
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    ...basketController.cartItmes
                        .asMap()
                        .map(
                          (i, val) => MapEntry(
                            i,
                            Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Container(
                                height: getScreenHeight(90),
                                width: SizeConfig.screenWidth,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 5)
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child:
                                            Image.asset(val.image.toString()),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12),
                                      child: Container(
                                        width: getScreenWidth(120),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              val.name.toString(),
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "${val.quantity.toString()} kg",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              "₹ ${val.price.toString()}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Divider(
                thickness: 1,
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sub Total",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "₹${basketController.totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Coupon Discount",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "₹10.00",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Total Pay",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "₹${basketController.totalPrice.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Payment Detail:",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  Image.asset(AppImages.paymentSign),
                  Text(
                    "****2536",
                    style: TextStyle(fontSize: 15, letterSpacing: 4),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    height: getScreenHeight(50),
                    width: getScreenWidth(135),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.asset(AppImages.print),
                          Spacer(),
                          Text(
                            "Print",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade300)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
