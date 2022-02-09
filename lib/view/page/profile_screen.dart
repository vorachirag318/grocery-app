import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controller/auth/profile_controller.dart';
import 'package:grocery_app/utils/config/device_size.dart';
import 'package:grocery_app/view/page/my_information_screen.dart';
import 'package:grocery_app/view/page/my_order_screen.dart';
import 'package:grocery_app/view/widget/appbarback.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          getScreenHeight(98),
        ),
        child: AppBarBack(
          title: "Profile",
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: getScreenHeight(120),
              width: SizeConfig.screenWidth,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: getScreenHeight(90),
                      width: getScreenWidth(90),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Micra Solution",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text("hi@micrasolution.com")
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 5)
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ...profileController.profilelist
              .asMap()
              .map(
                (i, element) => MapEntry(
                  i,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Image.asset(element["icon"]),
                          title: Text(
                            element["name"],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: GestureDetector(
                              onTap: () {
                                if (i == 0) {
                                  Get.to(MyOrderScreen());
                                } else if (i == 1) {
                                  Get.to(MyInformationScreen());
                                }
                              },
                              child: Icon(Icons.chevron_right)),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        )
                      ],
                    ),
                  ),
                ),
              )
              .values
              .toList()
        ],
      ),
    );
  }
}
