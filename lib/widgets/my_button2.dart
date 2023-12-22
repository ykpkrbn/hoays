import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/textStyle.dart';

class MyButton2 extends StatelessWidget {
  /// Buton Text Kısmı
  final String? buttonText;

  /// Butonun fonksiyon kısmı
  final Function()? onPressed;

  /// Butonun sağında icon var mı yok mu onu kontrol eder.
  final bool? isRightImage;

  const MyButton2(
      {super.key, this.buttonText, this.onPressed, this.isRightImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        minWidth: Get.size.width * .8,
        height: 49,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31),
        ),
        color: MyColors.orangeColor,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: isRightImage == true
                  ? const EdgeInsets.all(8.0)
                  : const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SvgPicture.asset(MyIcons.rocketIcon),
            ),
            Text(
              buttonText ?? 'Get More Messages',
              style: MyTextStyle.lexendButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isRightImage == true
                  ? SvgPicture.asset(MyIcons.arrowLeftIcon)
                  : const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Text(''),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
