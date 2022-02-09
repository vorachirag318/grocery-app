import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/basket_controller.dart';
import 'package:grocery_app/controller/auth/fruites_vegetable_contoller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/device_size.dart';

class BasketScreen extends StatelessWidget {
  final BasketController basketController = Get.put(BasketController());
  final FruitesVegetableController fruitesVegetableController =
      Get.put(FruitesVegetableController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ...basketController.cartItmes
                  .asMap()
                  .map(
                    (i, val) => MapEntry(
                      i,
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Container(
                            height: getScreenHeight(90),
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5)
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.asset(val.image.toString()),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  child: Container(
                                    width: getScreenWidth(120),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          val.name.toString(),
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "1 kg",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey.shade500),
                                        ),
                                        Text(
                                          "₹ ${val.price.toString()}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        val.quantity!.value--;
                                        val.quantity!.value == 0
                                            ? basketController.removeItems(val)
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
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child:
                                          Text(val.quantity!.value.toString()),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        val.quantity!.value++;
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
                                )
                              ],
                            )),
                      ),
                    ),
                  )
                  .values
                  .toList(),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
