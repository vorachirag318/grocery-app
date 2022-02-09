import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_images.dart';

class DashBoardController extends GetxController {
  List<Map<String, dynamic>> itemsdetails = [
    {
      "name": "Fruits",
      "image": AppImages.d1,
      "Color": Colors.pink.shade100,
    },
    {
      "name": "Juice",
      "image": AppImages.d2,
      "Color": Colors.pink.shade50,
    },
    {
      "name": "vegetables",
      "image": AppImages.d3,
      "Color": Colors.green.shade50,
    },
    {
      "name": "Meats",
      "image": AppImages.d4,
      "Color": Colors.pink.shade100,
    },
    {
      "name": "Bakery",
      "image": AppImages.d5,
      "Color": Colors.pink.shade50,
    }
  ];
}
