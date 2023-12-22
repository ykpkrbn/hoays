import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/page/home/home_page.dart';
import 'package:hoays/page/profile/profile_page.dart';
import 'package:hoays/page/story/story_page.dart';
import 'package:hoays/page/token/token_page.dart';

class MyBottomNavBarController extends GetxController {

  RxList<Widget> pages = <Widget>[].obs;

  @override
  void onInit() {
    pages.addAll(_pages);
    super.onInit();
  }
  final List<Widget> _pages = [
    const HomePage(),
    const StoryPage(),
    const TokenPage(),
    const ProfilePage(),
  ];

  RxInt selectedIndex = 0.obs;

  void handleIndexChanged(int index) {
    selectedIndex.value = index;
  }
}
