import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/producategory_controller.dart';
import 'package:grocery_app/view/page/fruits_vegetable_screen.dart';
import 'package:grocery_app/view/widget/expansion_panel.dart';

class ProductCategory extends StatelessWidget {
  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productCategoryController.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Image.asset(productCategoryController.items[index].image
                        .toString()),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      productCategoryController.items[index].header,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        productCategoryController
                                .items[index].isExpanded!.value =
                            !productCategoryController
                                .items[index].isExpanded!.value;

                        print(
                            productCategoryController.items[index].isExpanded);
                      },
                      icon: Icon(Icons.expand_more),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Obx(
                () => ExpandedSection(
                  expand:
                      productCategoryController.items[index].isExpanded!.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...productCategoryController.items[index].body
                          .asMap()
                          .map((i, element) => MapEntry(
                              i,
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(FruitesVegetableScreen());
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600),
                                      ),
                                      Divider()
                                    ],
                                  ),
                                ),
                              )))
                          .values
                          .toList()
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
