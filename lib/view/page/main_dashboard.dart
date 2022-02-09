import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/basket_controller.dart';
import 'package:grocery_app/controller/auth/pageview_controller.dart';
import 'package:grocery_app/utils/config/app_colors.dart';
import 'package:grocery_app/utils/config/app_icons.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/page/basket_screen.dart';
import 'package:grocery_app/view/page/cheakout_screen.dart';
import 'package:grocery_app/view/page/coupons.dart';
import 'package:grocery_app/view/page/dashboard.dart';
import 'package:grocery_app/view/page/product_category.dart';
import 'package:grocery_app/view/page/profile_screen.dart';

class MainDashBoard extends StatelessWidget {
  final pageViewController = Get.put(PageViewController());
  final BasketController basketController = Get.put(BasketController());

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => Scaffold(
        bottomSheet: pageViewController.currentPageIndex.value == 3
            ? Container(
                height: getScreenHeight(115),
                child: Column(
                  children: [
                    Container(
                      height: getScreenHeight(45),
                      color: Colors.black,
                      child: Center(
                          child: Text(
                        "Total Pay : ₹${basketController.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(CheoutScreen());
                        },
                        child: Container(
                          height: getScreenHeight(52),
                          color: AppColors.appColors,
                          child: Center(
                            child: Text(
                              "Check out",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : null,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Home(),
            ProductCategory(),
            Coupons(),
            BasketScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          height: getScreenHeight(65),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomNavigation(AppIcons.bottom1Icon, 0),
                bottomNavigation(AppIcons.bottom2Icon, 1),
                bottomNavigation(AppIcons.bottom3Icon, 2),
                bottomNavigation(AppIcons.bottom4Icon, 3),
              ],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            pageViewController.currentPageIndex.value == 2
                ? getScreenHeight(80)
                : getScreenHeight(155),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppIcons.menuIcon),
                        Text(
                          pageViewController.currentPageIndex.value == 0
                              ? "Dashboard"
                              : pageViewController.currentPageIndex.value == 1
                                  ? "Product Category"
                                  : pageViewController.currentPageIndex.value ==
                                          2
                                      ? "Coupons"
                                      : "Review Basket",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(ProfileScreen());
                            },
                            child: Image.asset(AppIcons.personIcon)),
                      ],
                    ),
                    pageViewController.currentPageIndex.value != 2
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 25),
                            child: Container(
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
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          border: InputBorder.none),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavigation(String image, int index) => Obx(
        () => GestureDetector(
          onTap: () {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 100), curve: Curves.ease);
            pageViewController.currentPageIndex.value = index;
          },
          child: Container(
            child: Image.asset(
              image,
              color: pageViewController.currentPageIndex.value == index
                  ? AppColors.appColors
                  : Colors.black45,
            ),
          ),
        ),
      );
}
