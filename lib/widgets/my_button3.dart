import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/textStyle.dart';

class MyButton3 extends StatelessWidget {
  /// Buton Text Kısmı
  final String? buttonText;

  /// Butonun fonksiyon kısmı
  final Function()? onPressed;

  /// Butonun rengini belirler
  final Color? color;

  /// Ortadaki İcon Gözüküp gözükmemesini sağlayan
  final bool? isIconSeen;

  final double? height;

  const MyButton3({
    super.key,
    this.buttonText,
    this.onPressed,
    this.color,
    this.isIconSeen = true,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconSeen == true)
              SvgPicture.asset(MyIcons.starIcon, width: 36)
            else
              const Text(''),
            isIconSeen == true
                ? const SizedBox(width: 15)
                : const SizedBox(width: 0),
            Text(
              buttonText ?? 'Get More Messages',
              style: MyTextStyle.lexendButton(),
            ),
          ],
        ),
      ),
    );
  }
}
