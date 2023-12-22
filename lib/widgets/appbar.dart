import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hoays/page/token/best_of_week.dart';
import 'package:hoays/page/token/token_win_page.dart';

import '../utils/icons.dart';
import '../utils/textStyle.dart';

class MyAppBar extends StatelessWidget {
  /// Appbar yazının olduğu kısım
  final String? title;

  /// Appbar action kısmında iki tane iconbutton olursa width 60 ver. Yoksa 0 ver
  final double? width;

  ///Appbar action sol kısımda icon bottom olacak mı olmayacak mı onun kontrolü
  final Widget? action;

  /// Appbar action sağ kısmında icon bottom farklı olabilir
  final IconButton? iconButton;

  const MyAppBar(
      {super.key, this.title, this.width, this.action, this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: SvgPicture.asset(MyIcons.chatIcon)),
        SizedBox(width: width ?? 60),
        Expanded(
          child: Text(
            title ?? '',
            textAlign: TextAlign.center,
            style: MyTextStyle.lato(),
          ),
        ),
        Row(
          children: [
            action ??
                IconButton(
                    onPressed: () {
                      Get.to(()=> const TokenWinPage());
                    },
                    icon: SvgPicture.asset(
                      MyIcons.starIcon,
                      width: 44,
                    )),
            iconButton ??
                IconButton(
                    onPressed: () {
                      Get.to(()=> const BestOfWeek());
                    },
                    icon: SvgPicture.asset(MyIcons.crownIcon)),
          ],
        )
      ],
    );
  }
}
