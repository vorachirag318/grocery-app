import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_images.dart';

class ProductCategoryController extends GetxController {
  List<ExpansionItem> items = <ExpansionItem>[
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e1,
      header: "Fruits & vegetables",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e2,
      header: "Food grains, oil & masala",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e3,
      header: "Bakery, cakes & Dairy",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e4,
      header: "Beverages",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e5,
      header: "Snacks & Branded",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e6,
      header: "Beauty & Hygiene",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e7,
      header: "Cleaning & Household",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
    ExpansionItem(
      isExpanded: false.obs,
      image: AppImages.e8,
      header: "Kitchen, Garden & Pets",
      body: [
        "All Fruits & vegetables",
        "Fresh vegetables",
        "Herbs & seasonings",
        "Exotic Fruits",
        "Fresh Fruits"
      ],
    ),
  ];
}

class ExpansionItem extends GetxController {
  RxBool? isExpanded;
  final String header;
  final List<String> body;
  final String? image;

  ExpansionItem(
      {this.isExpanded, required this.header, required this.body, this.image});
}
