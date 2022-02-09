import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/related_product.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/utils/config/device_size.dart';

class FruitsVegetalbleDetailsScreen extends StatelessWidget {
  final RelatedProductController relatedProductController =
      Get.put(RelatedProductController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var data = Get.arguments;
    return Scaffold(
      bottomNavigationBar: Container(
        height: getScreenHeight(50),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: AppColors.removeColors,
                  child: Center(
                      child: Text(
                    "SAVE FOR LATER",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: AppColors.appColors,
                  child: Center(
                      child: Text(
                    "ADD TO BASKET",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          getScreenHeight(155),
        ),
        child: SafeArea(
          child: Container(
            color: AppColors.appColors,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          AppIcons.backarrowIcon,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Search Product",
                                  hintStyle: TextStyle(fontSize: 14),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
                                  border: InputBorder.none),
                              style: TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: getScreenHeight(270),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: getScreenHeight(10),
                    ),
                    Container(
                      height: getScreenHeight(210),
                      width: getScreenWidth(312),
                      child: Image.asset(
                        data.image.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: getScreenHeight(10),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name.toString(),
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Text(
                            "₹${data.price}",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "1 kg",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getScreenHeight(10),
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
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "About this product",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                data.details,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Related products",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(
                    relatedProductController.relatedproduct.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Container(
                          height: getScreenHeight(130),
                          width: getScreenWidth(104),
                          child: Image.asset(
                            relatedProductController.relatedproduct[index],
                            fit: BoxFit.fitHeight,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5, color: Colors.grey.shade400)
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
