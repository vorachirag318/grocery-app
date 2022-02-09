import 'package:get/get.dart';
import 'package:grocery_app/utils/config/app_images.dart';

class WelcomeScreenContoller extends GetxController {
  var isSelected = 0.obs;
  List welcomeScreenList = [
    {
      "image": AppImages.welcomeImage1,
      "title": "Welcome to Grocery App",
      "labal1": "Getting your day to day goods is now",
      "label2": "just a matter or some click.",
    },
    {
      "image": AppImages.welcomeImage2,
      "title": "Fresh Grocery",
      "labal1": "Find fresh, high-quality food and",
      "label2": "all your supermarket brand favorites.",
    },
    {
      "image": AppImages.welcomeImage3,
      "title": "Fast Doorstep Delivery",
      "labal1": "Our delivery executive will deliver",
      "label2": "your order in under 24 hours",
    },
  ];
}
