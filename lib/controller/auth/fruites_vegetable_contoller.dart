import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_images.dart';

class FruitesVegetableController extends GetxController {
  List<FruitsVeg> fruitesvegetable = <FruitsVeg>[
    FruitsVeg(
        image: AppImages.fruitsvegetableimages1,
        name: "Fresh Banana",
        price: 20,
        quantity: 0.obs,
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    FruitsVeg(
        image: AppImages.fruitsvegetableimages2,
        name: "Fresh Kiwi",
        price: 10,
        quantity: 0.obs,
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    FruitsVeg(
        image: AppImages.fruitsvegetableimages3,
        name: "Capsicum - Green",
        price: 30,
        quantity: 0.obs,
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    FruitsVeg(
        image: AppImages.fruitsvegetableimages4,
        name: "Tomato-Hybrid",
        price: 45,
        quantity: 0.obs,
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    FruitsVeg(
        image: AppImages.fruitsvegetableimages5,
        name: "Fresh Apple",
        price: 60,
        quantity: 0.obs,
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    FruitsVeg(
        image: AppImages.fruitsvegetableimages1,
        name: "Fresh Aloo",
        price: 20,
        quantity: 0.obs,
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
    FruitsVeg(
        image: AppImages.fruitsvegetableimages2,
        name: "Fresh Tomato",
        price: 60,
        quantity: 0.obs,
        details:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
  ];
}

class FruitsVeg extends GetxController {
  final String? image;
  final String? name;
  final int? price;
  final RxInt? quantity;
  final String? details;

  FruitsVeg({this.image, this.name, this.price, this.quantity, this.details});
}
