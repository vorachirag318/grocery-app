import 'package:flutter/material.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/widget/appbarback.dart';
import 'package:grocery_app/view/widget/common_button.dart';
import 'package:grocery_app/view/widget/common_textfiled.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          getScreenHeight(98),
        ),
        child: AppBarBack(
          title: "Payment Method",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Card Number",
                  style: TextStyle(fontSize: 16, color: AppColors.textColor),
                ),
              ),
              CommonTextFiled(),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Card Holder Name",
                  style: TextStyle(fontSize: 16, color: AppColors.textColor),
                ),
              ),
              CommonTextFiled(),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Exp Date",
                            style: TextStyle(
                                fontSize: 16, color: AppColors.textColor),
                          ),
                          CommonTextFiled(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CCV",
                            style: TextStyle(
                                fontSize: 16, color: AppColors.textColor),
                          ),
                          CommonTextFiled(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 160,
              ),
              CommonButton(name: "Save")
            ],
          ),
        ),
      ),
    );
  }
}
