import 'package:flutter/material.dart';
import 'package:grocery_app/utils/config/app_colors.dart';

class CommonTextFiled extends StatelessWidget {
  const CommonTextFiled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextFormField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(border: InputBorder.none),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.appColors, width: 1),
        ),
      ),
    );
  }
}
