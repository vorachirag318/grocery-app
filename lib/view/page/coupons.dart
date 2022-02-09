import 'package:flutter/material.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_images.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/widget/fdottedline.dart';

class Coupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
            child: FDottedLine(
              height: getScreenHeight(100),
              width: SizeConfig.screenWidth,
              color: AppColors.appColors,
              corner: FDottedLineCorner.all(15),
              strokeWidth: 1.2,
              space: 5,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Image.asset(AppImages.coupons1),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fresh Fruits",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: getScreenHeight(10),
                      ),
                      Text(
                        "20% OFF",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getScreenHeight(10),
                      ),
                      Text(
                        "Valid until 30 Jun 2020",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "Promo code",
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: getScreenHeight(10),
                      ),
                      Text(
                        "KP1234568901",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getScreenHeight(10),
                      ),
                      Icon(Icons.content_copy)
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
