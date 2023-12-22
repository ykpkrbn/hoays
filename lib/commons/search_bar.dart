import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../page/home/home_controller.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return TextFormField(
      controller: homeController.searchEditingCtrl,
      focusNode: homeController.focusNode,
      cursorColor: MyColors.orangeColor,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(MyIcons.searchIcon),
          ),
        ),
      ),
    );
  }
}
