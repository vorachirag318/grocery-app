import 'package:get/get.dart';

class RefineByController extends GetxController {
  var isSelected = 0.obs;

  List<Map<String, dynamic>> refineByList = [
    {
      "name": "Brand",
      "List": [
        "Local Garden",
        "Roted",
        "Taste of Sun",
        "Fruity",
        "Happy Apple"
      ],
    },
    {
      "name": "Price",
      "List": [
        "Less than Rs 20",
        "Rs 21 to Rs 50",
        "Rs 51 to Rs 100",
        "Rs 101 to Rs 200",
        "Rs 201 to Rs 500",
        "More then Rs 501"
      ],
    },
    {
      "name": "Discount",
      "List": ["10 %", "20 %", "50 %"],
    },
    {
      "name": "Pack size",
      "List": [
        "3 x 9",
        "5 x 10",
        "6 x 12",
        "7 x 14",
        "8 x 18",
        "10 x 20",
        "12 x 22"
      ],
    }
  ];
}
