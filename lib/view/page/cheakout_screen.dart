import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/basket_controller.dart';
import 'package:grocery_app/controller/auth/delivery_time_controller.dart';
import 'package:grocery_app/controller/auth/fruites_vegetable_contoller.dart';
import 'package:grocery_app/controller/auth/payment_method_controller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_images.dart';

import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/page/payment_method.dart';
import 'package:grocery_app/view/page/shipping_addresh.dart';
import 'package:grocery_app/view/widget/appbarback.dart';

class CheoutScreen extends StatelessWidget {
  final BasketController basketController = Get.put(BasketController());
  final FruitesVegetableController fruitesVegetableController =
      Get.put(FruitesVegetableController());
  final DeliveryTimeController deliveryTimeController =
      Get.put(DeliveryTimeController());
  final PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          getScreenHeight(98),
        ),
        child: AppBarBack(
          title: "Cheakout",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "1 kg",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color:
                                                        Colors.grey.shade500),
                                              ),
                                              Text(
                                                "₹ ${val.price.toString()}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              val.quantity!.value--;
                                              val.quantity!.value == 0
                                                  ? basketController
                                                      .removeItems(val)
                                                  // ignore: unnecessary_statements
                                                  : null;
                                            },
                                            child: Container(
                                              height: getScreenHeight(26),
                                              width: getScreenWidth(26),
                                              child: Icon(
                                                Icons.remove,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: AppColors.removeColors,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                                val.quantity!.value.toString()),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              val.quantity!.value++;
                                            },
                                            child: Container(
                                              height: getScreenHeight(26),
                                              width: getScreenWidth(26),
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.appColors,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )),
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Shipping Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(ShippingAdressScreen());
                    },
                    child: Text(
                      "Add New",
                      style:
                          TextStyle(fontSize: 10, color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: getScreenHeight(80),
                          width: getScreenWidth(255),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "406,Micra solution",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "City center",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade400),
                                ),
                                Text(
                                  "yogichowk,surat",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300, blurRadius: 5)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Delivery Time",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 25,
                  onChanged: (String? newValue) {
                    deliveryTimeController.setSelected(newValue!);
                  },
                  value: deliveryTimeController.selected.value,
                  items: deliveryTimeController.listitem.map(
                    (selectedType) {
                      return DropdownMenuItem(
                        child: new Text(
                          selectedType,
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        value: selectedType,
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Coupon code",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    height: getScreenHeight(50),
                    width: getScreenWidth(240),
                    child: TextFormField(
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: AppColors.appColors, width: 1),
                      ),
                    ),
                  ),
                  Container(
                      height: getScreenHeight(50),
                      width: getScreenWidth(100),
                      color: AppColors.appColors,
                      child: Center(
                          child: Text(
                        "Apply",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Payment Method",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  paymentMethodButton(0, "Credit/Debit card"),
                  SizedBox(
                    width: 15,
                  ),
                  paymentMethodButton(1, "COD")
                ],
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: paymentMethodController.isSelected.value == 0
                    ? Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Get.to(PaymentMethodScreen());
                            },
                            child: Text(
                              "Add New",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade700),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
            Obx(
              () => paymentMethodController.isSelected.value == 0
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: List.generate(
                            paymentMethodController.creditCardNumber.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    paymentMethodController
                                        .creditCardNumnerSelected.value = index;
                                  },
                                  child: Container(
                                    height: getScreenHeight(60),
                                    width: getScreenWidth(220),
                                    child: Padding(
                                      child: Row(
                                        children: [
                                          Image.asset(AppImages.paymentSign),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            paymentMethodController
                                                .creditCardNumber[index],
                                            style: TextStyle(
                                                color: paymentMethodController
                                                            .creditCardNumnerSelected
                                                            .value ==
                                                        index
                                                    ? Colors.white
                                                    : Colors.black,
                                                letterSpacing: 10,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                    ),
                                    decoration: BoxDecoration(
                                      color: paymentMethodController
                                                  .creditCardNumnerSelected
                                                  .value ==
                                              index
                                          ? Colors.black
                                          : Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 5)
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1,
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
            SizedBox(
              height: 35,
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    Get.to(CheoutScreen());
                  },
                  child: Container(
                    height: getScreenHeight(52),
                    color: AppColors.appColors,
                    child: Center(
                      child: Text(
                        "Total Pay ₹${basketController.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget paymentMethodButton(int index, String name) {
    return Obx(
      () => Row(
        children: [
          GestureDetector(
            onTap: () {
              paymentMethodController.isSelected.value = index;
            },
            child: Container(
              height: 29,
              width: 29,
              child: paymentMethodController.isSelected.value == index
                  ? Center(
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white,
                      ),
                    )
                  : null,
              decoration: paymentMethodController.isSelected.value == index
                  ? BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    )
                  : BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1),
                    ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
