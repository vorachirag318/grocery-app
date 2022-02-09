import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/fruites_vegetable_contoller.dart';

class BasketController extends GetxController {
  var cartItmes = <FruitsVeg>[].obs;

  double get totalPrice => cartItmes.fold(
      0, (sum, items) => sum + (items.quantity! * items.price!.toDouble()));

  addItems(FruitsVeg fruitsVeg) {
    if (cartItmes.contains(fruitsVeg)) {
    } else {
      cartItmes.add(fruitsVeg);
    }
  }

  removeItems(FruitsVeg fruitsVeg) {
    cartItmes.remove(fruitsVeg);
  }
}
