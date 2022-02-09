import 'package:get/get.dart';

class DeliveryTimeController extends GetxController {
  final selected = "8:30 a.m.".obs;

  setSelected(String value) {
    selected.value = value;
  }

  List<String> listitem = [
    "8:30 a.m.",
    "10:30 a.m.",
    "12:00 p.m. ",
    "2:00 p.m.",
    "5:00 p.m."
  ];
}
