import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/basket_controller.dart';
import 'package:grocery_app/controller/auth/fruites_vegetable_contoller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/page/filter_screen.dart';
import 'package:grocery_app/view/page/fruits_vegetable_detailsscreen.dart';

class FruitesVegetableScreen extends StatelessWidget {
  final FruitesVegetableController fruitesVegetableController =
      Get.put(FruitesVegetableController());

  final BasketController basketController = Get.put(BasketController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          getScreenHeight(155),
        ),
        child: SafeArea(
          child: Container(
            color: AppColors.appColors,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          AppIcons.backarrowIcon,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Fruites & vegetables",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      children: [
                        Container(
                          width: getScreenWidth(288),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search),
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Search Product",
                                      hintStyle: TextStyle(fontSize: 14),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      border: InputBorder.none),
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(FilterScreen());
                          },
                          child: Container(
                            width: getScreenWidth(50),
                            height: getScreenHeight(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Icon(Icons.tune,
                                size: getScreenHeight(30), color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            itemCount: fruitesVegetableController.fruitesvegetable.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                childAspectRatio: 5 / 5.2,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(FruitsVegetalbleDetailsScreen(),
                                  arguments: fruitesVegetableController
                                      .fruitesvegetable[index]);
                            },
                            child: Image.asset(fruitesVegetableController
                                .fruitesvegetable[index].image
                                .toString()),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              fruitesVegetableController
                                  .fruitesvegetable[index].name
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getScreenHeight(7),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 6),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1 kg",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: getScreenHeight(10),
                                  ),
                                  Text(
                                    "₹ ${fruitesVegetableController.fruitesvegetable[index].price}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Spacer(),
                              fruitesVegetableController.fruitesvegetable[index]
                                          .quantity!.value ==
                                      0
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        fruitesVegetableController
                                            .fruitesvegetable[index]
                                            .quantity!
                                            .value--;
                                        fruitesVegetableController
                                                    .fruitesvegetable[index]
                                                    .quantity!
                                                    .value ==
                                                0
                                            ? basketController.removeItems(
                                                fruitesVegetableController
                                                    .fruitesvegetable[index])
                                            // ignore: unnecessary_statements
                                            : null;
                                      },
                                      child: Container(
                                        height: getScreenHeight(26),
                                        width: getScreenWidth(26),
                                        child: Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors.removeColors,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                    ),
                              fruitesVegetableController.fruitesvegetable[index]
                                          .quantity!.value ==
                                      0
                                  ? Container()
                                  : Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        fruitesVegetableController
                                            .fruitesvegetable[index]
                                            .quantity!
                                            .value
                                            .toString(),
                                      ),
                                    ),
                              GestureDetector(
                                onTap: () {
                                  basketController.addItems(
                                      fruitesVegetableController
                                          .fruitesvegetable[index]);
                                  fruitesVegetableController
                                      .fruitesvegetable[index]
                                      .quantity!
                                      .value++;
                                },
                                child: Container(
                                  height: getScreenHeight(26),
                                  width: getScreenWidth(26),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.appColors,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                        )
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
