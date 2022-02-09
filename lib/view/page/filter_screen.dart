import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/filter_controller.dart';
import 'package:grocery_app/controller/auth/refineBy_controller.dart';
import 'package:grocery_app/controller/auth/sortBy_controller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/widget/common_button.dart';

class FilterScreen extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);
  final FilterController filterController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomSheet: CommonButton(
        name: "Done",
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: AppColors.appColors,
        title: Text("Filter"),
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            height: 58,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  tabBarButton("Refine by", 0),
                  tabBarButton("Sort by", 1),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(70),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [RefineBy(), SortBy()],
      ),
    );
  }

  Widget tabBarButton(String name, int index) {
    return Obx(() => Expanded(
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(index,
                  duration: Duration(microseconds: 100),
                  curve: Curves.bounceIn);
              filterController.isSelected.value = index;
            },
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(name,
                        style: TextStyle(
                            color: filterController.isSelected.value == index
                                ? AppColors.appColors
                                : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  filterController.isSelected.value == index
                      ? Container(
                          height: 4,
                          color: AppColors.appColors,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ));
  }
}

class RefineBy extends StatelessWidget {
  final RefineByController refineByController = Get.put(RefineByController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Obx(
            () => Expanded(
              child: Column(
                children: [
                  ...refineByController.refineByList
                      .asMap()
                      .map(
                        (i, element) => MapEntry(
                          i,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  refineByController.isSelected.value = i;
                                },
                                child: Container(
                                  color:
                                      refineByController.isSelected.value == i
                                          ? AppColors.appColors
                                          : Colors.white,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: Text(
                                          element["name"],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: refineByController
                                                          .isSelected.value ==
                                                      i
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(Icons.chevron_right,
                                          color: refineByController
                                                      .isSelected.value ==
                                                  i
                                              ? Colors.white
                                              : Colors.grey.shade500)
                                    ],
                                  ),
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList()
                ],
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: Column(
                children: [
                  ...refineByController
                      .refineByList[refineByController.isSelected.value]["List"]
                      .asMap()
                      .map(
                        (i, element) => MapEntry(
                          i,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Text(
                                      element,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SortBy extends StatelessWidget {
  final SortByController sortByController = Get.put(SortByController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          ...sortByController.sortByList
              .asMap()
              .map(
                (i, element) => MapEntry(
                    i,
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                element,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  sortByController.isSelectedsortByList.value =
                                      i;
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  child: sortByController
                                              .isSelectedsortByList.value ==
                                          i
                                      ? Center(
                                          child: CircleAvatar(
                                            radius: 5,
                                            backgroundColor: Colors.white,
                                          ),
                                        )
                                      : null,
                                  decoration: sortByController
                                              .isSelectedsortByList.value ==
                                          i
                                      ? BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        )
                                      : BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(width: 1),
                                        ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(),
                        ],
                      ),
                    )),
              )
              .values
              .toList()
        ],
      ),
    );
  }
}
