import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/utils/icons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            SvgPicture.asset(MyIcons.hoaysIcons),
            Container(
              width: Get.size.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                color: MyColors.yellowColor,
                borderRadius: BorderRadius.circular(41),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 4),
                  Expanded(
                    child: MaterialButton(
                      minWidth: Get.size.width,
                      padding: EdgeInsets.zero,
                      shape: const StadiumBorder(),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {},
                      child: Container(
                        height: 42,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColors.orangeColor,
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: const Text('Giriş Yap'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: MaterialButton(
                      minWidth: Get.size.width,
                      padding: EdgeInsets.zero,
                      shape: const StadiumBorder(),
                      onPressed: () {},
                      child: Container(
                        height: 42,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: MyColors.orangeColor,
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: const Text('Üye Ol'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
