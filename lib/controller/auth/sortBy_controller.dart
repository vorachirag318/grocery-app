import 'package:get/get.dart';

class SortByController extends GetxController {
  var isSelectedsortByList = 0.obs;

  List sortByList = [
    "Popularity",
    "Price - Low to High",
    "Price - High to Low",
    "Alphabetical",
    "% off - High to Low",
    "Rupee saving - High to Low",
    "Rupee saving - Low to High"
  ];
}
