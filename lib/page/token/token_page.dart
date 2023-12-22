import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/utils/images.dart';
import 'package:hoays/utils/textStyle.dart';
import 'package:hoays/widgets/appbar.dart';
import 'package:hoays/widgets/my_button2.dart';

class TokenPage extends StatelessWidget {
  const TokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              height: 200,
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
                          style: MyTextStyle.poppins(),
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          MyButton2(
            buttonText: 'Daha fazla kişiyle konuş',
            onPressed: () {},
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
