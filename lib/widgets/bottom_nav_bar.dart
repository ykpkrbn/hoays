import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoays/controller/bottom_nav_bar_controller.dart';
import 'package:hoays/utils/icons.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    MyBottomNavBarController myBottomNavBarController =
        Get.put(MyBottomNavBarController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24,bottom: 24,right: 24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(-1, 1), // Changes position of shadow
              ),
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(1, -1), // Changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.hardEdge,
            child: Obx(
              () {
                return BottomNavigationBar(
                  currentIndex: myBottomNavBarController.selectedIndex.value,
                  onTap: (aaa) {
                    myBottomNavBarController.handleIndexChanged(aaa);
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(MyIcons.homeSelected,
                            fit: BoxFit.cover),
                        icon: SvgPicture.asset(MyIcons.home, fit: BoxFit.cover),
                        label: 'Ana Sayfa',
                        tooltip: 'Ana Sayfa'),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(MyIcons.storySelected,
                            fit: BoxFit.cover),
                        icon:
                            SvgPicture.asset(MyIcons.story, fit: BoxFit.cover),
                        label: 'Hikaye',
                        tooltip: 'Hikaye'),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(MyIcons.tokenSelected,
                            fit: BoxFit.cover),
                        icon:
                            SvgPicture.asset(MyIcons.token, fit: BoxFit.cover),
                        label: 'Jeton',
                        tooltip: 'Jeton'),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(MyIcons.profileSelected,
                            fit: BoxFit.cover),
                        icon: SvgPicture.asset(MyIcons.profile,
                            fit: BoxFit.cover),
                        label: 'Profil',
                        tooltip: 'Profil'),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() => myBottomNavBarController
            .pages[myBottomNavBarController.selectedIndex.value]),
      ),
    );
  }
}
