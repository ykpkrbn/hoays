import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/utils/colors.dart';

import '../utils/textStyle.dart';

class MyAppBar2 extends StatelessWidget {
  /// Appbar yazının olduğu kısım
  final String? title;

  const MyAppBar2({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.1,0.6],
          colors: [
            MyColors.yellowColor,
            MyColors.orangeColor,
          ],
        ),
      ),
      child: Row(
        children: [
          _buildIconButton(
            icons: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(
            child: Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: MyTextStyle.lato(),
            ),
          ),
          _buildIconButton(
            icons: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Container _buildIconButton({required Widget icons, Function()? onPressed}) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50)),
      child: IconButton(onPressed: onPressed, icon: icons),
    );
  }
}
