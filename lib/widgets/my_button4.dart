import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/textStyle.dart';

class MyButton4 extends StatelessWidget {
  /// Buton Text Kısmı
  final String? buttonText;

  final String? buttonText2;

  /// Butonun fonksiyon kısmı
  final Function()? onPressed;

  /// Butonun rengini belirler
  final Color? color;

  final double? height;

  const MyButton4({
    super.key,
    this.buttonText,
    this.buttonText2,
    this.onPressed,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        minWidth: Get.size.width * .8,
        height: height ?? 54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),

        color: color ?? MyColors.blueColor,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                buttonText ?? 'Button 4',
                style: MyTextStyle.lexendButton(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                buttonText2 ?? '0',
                style: MyTextStyle.lexendButton(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
