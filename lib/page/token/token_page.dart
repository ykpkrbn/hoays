import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoays/page/token/token_win_page.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/utils/images.dart';
import 'package:hoays/utils/textStyle.dart';
import 'package:hoays/widgets/appbar.dart';
import 'package:hoays/widgets/my_button2.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_button3.dart';

class TokenPage extends StatelessWidget {
  const TokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const MyAppBar(
            title: 'Jeton',
            width: 0,
            action: SizedBox(width: 0),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 250,
              width: Get.size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        MyColors.jetonRenk1,
                        MyColors.jetonRenk2,
                        MyColors.jetonRenk3,
                      ])),
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        maxRadius: 64,
                        minRadius: 40,
                        backgroundColor: MyColors.orangeColor,
                        backgroundImage: AssetImage(MyImages.img),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          MyImages.jeton,
                          width: 146,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Get to the TOP!',
                          style: MyTextStyle.poppins(color: Colors.black),
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          MyButton2(
            buttonText: 'Daha fazla kişiyle konuş',
            onPressed: () {},
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMadalya(
                  child: SvgPicture.asset(MyImages.madalyaBronz),
                  colors: [
                    MyColors.madalyaBronz1,
                    MyColors.madalyaBronz2,
                  ],
                ),
                _buildMadalya(
                  child: SvgPicture.asset(MyImages.madalyaGold),
                  colors: [
                    MyColors.madalyaGold1,
                    MyColors.madalyaGold2,
                  ],
                ),
                _buildMadalya(
                  child: SvgPicture.asset(MyImages.madalyaSilver),
                  colors: [
                    MyColors.madalyaSilver1,
                    MyColors.madalyaSilver2,
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: MyButton(
              onPressed: () {},
              text: 'Öne Çık',
            ),
          ),
          const SizedBox(height: 20),
          MyButton3(
            onPressed: () {
              Get.to(()=> const TokenWinPage(
                backgroundImage: AssetImage(MyImages.img),
              ));
            },
            buttonText: 'Jeton Kazan',
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Expanded _buildMadalya({Widget? child, List<Color>? colors}) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        splashColor: MyColors.orangeColor,
        child: Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: child ?? SvgPicture.asset(MyImages.madalyaGold)),
                  ),
                ),
                Expanded(
                  child: Text(
                    '15 Dk Öne Çık',
                    style: MyTextStyle.lexend(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: colors ??
                              [
                                MyColors.madalyaGold1,
                                MyColors.madalyaGold2,
                              ]),
                    ),
                    child: Text(
                      '₺129,00',
                      style: MyTextStyle.lexendButton(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
