import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_icons.dart';

class ProfileController extends GetxController {
  List profilelist = [
    {"name": "My Orders", "icon": AppIcons.drawer1},
    {"name": "My Information", "icon": AppIcons.drawer2},
    {"name": "Shipping Address", "icon": AppIcons.drawer3},
    {"name": "Payment method", "icon": AppIcons.drawer4},
    {"name": "Settings", "icon": AppIcons.drawer5},
    {"name": "Logout", "icon": AppIcons.drawer6}
  ];
}
