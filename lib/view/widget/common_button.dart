import 'package:flutter/material.dart';

import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/device_size.dart';

class CommonButton extends StatelessWidget {
  final String name;
  final VoidCallback? voidCallback;

  const CommonButton({
    Key? key,
    required this.name,
    this.voidCallback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: GestureDetector(
        onTap: voidCallback,
        child: Container(
          height: 52,
          width: SizeConfig.screenWidth,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          decoration: BoxDecoration(color: AppColors.appColors),
        ),
      ),
    );
  }
}
