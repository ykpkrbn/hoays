import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/utils/textStyle.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final Function()? onPressed;
  final bool? isCenterTwoWidget;
  final IconData? icon;

  const MyButton({
    super.key,
    this.size,
    this.color,
    required this.text,
    required this.onPressed,
    this.isCenterTwoWidget = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      minWidth: size ?? Get.size.width,
      onPressed: onPressed,
      height: 54,
      color: color ?? MyColors.orangeColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: isCenterTwoWidget == false
          ? Text(text, style: MyTextStyle.lato())
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                Text(text, style: MyTextStyle.lato()),
              ],
            ),
    );
  }
}
