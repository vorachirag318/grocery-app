import 'package:flutter/material.dart';
import 'package:grocery_app/utils/config/app_images.dart';
import 'package:grocery_app/utils/config/device_size.dart';

class Commonlogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.cp,
        ),
      ),
    );
  }
}
