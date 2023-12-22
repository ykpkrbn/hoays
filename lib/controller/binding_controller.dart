import 'package:get/get.dart';
import 'package:hoays/controller/bottom_nav_bar_controller.dart';
import 'package:hoays/page/home/home_controller.dart';
import 'package:hoays/page/onboarding/onboarding_controller.dart';

class MyBindingController extends Bindings {
  @override
  void dependencies() {
    Get.put<MyBottomNavBarController>(MyBottomNavBarController());
    Get.put<HomeController>(HomeController());
    Get.put<OnboardController>(OnboardController());
  }
}
