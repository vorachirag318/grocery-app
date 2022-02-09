import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  RxInt isSelected = 0.obs;
  RxInt creditCardNumnerSelected = 0.obs;

  List creditCardNumber = [
    "****256",
    "****152",
    "****890",
  ];
}
