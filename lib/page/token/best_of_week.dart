import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoays/model/user_model.dart';
import 'package:hoays/page/home/home_controller.dart';
import 'package:hoays/utils/icons.dart';
import 'package:hoays/utils/images.dart';
import 'package:hoays/utils/textStyle.dart';
import 'package:hoays/widgets/appbar2.dart';

import '../../utils/colors.dart';

class BestOfWeek extends StatelessWidget {
  const BestOfWeek({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MyAppBar2(title: 'Haftanın Enleri'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.users.length,
                  itemBuilder: (context, index) {
                    UserModel data = homeController.users[index];
                    if (index == 0) {
                      return _buildVipContainer(
                        tokenNumber: data.tokenNumber,
                        profileImage: data.userPhoto,
                        profilName: data.userName,
                      );
                    } else if (index == 1) {
                      return _buildVipContainer(
                        color: MyColors.blueColor,
                        vip: MyImages.vip2,
                        tokenNumber: data.tokenNumber,
                        profileImage: data.userPhoto,
                        profilName: data.userName,
                      );
                    } else if (index == 2) {
                      return _buildVipContainer(
                        color: Colors.deepOrangeAccent,
                        vip: MyImages.vip3,
                        tokenNumber: data.tokenNumber,
                        profileImage: data.userPhoto,
                        profilName: data.userName,
                      );
                    } else {
                      return _buildOtherUsers(
                        tokenNumber: data.tokenNumber,
                        profileImage: data.userPhoto,
                        profilName: data.userName,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ilk 3 kategorilerdeki vip kısma giremeyen kişiler
  Container _buildOtherUsers(
      {Color? color,
      String? profileImage,
      String? profilName,
      String? tokenNumber}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color ?? MyColors.orangeColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: MyColors.orangeColor,
                backgroundImage: AssetImage(profileImage ?? MyImages.img),
              ),
              const SizedBox(width: 10),
              Text(profilName ?? 'Demet', style: MyTextStyle.lexendButton()),
            ],
          ),
          Row(
            children: [
              Text(
                tokenNumber ?? '300',
                style: MyTextStyle.lexendButton(),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }

  /// Vip Sıralamasında bulunan Container
  Container _buildVipContainer(
      {Color? color,
      String? vip,
      String? profileImage,
      String? profilName,
      String? tokenNumber}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: color ?? Colors.black54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              SvgPicture.asset(vip ?? MyImages.vip1),
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: MyColors.orangeColor,
                backgroundImage: AssetImage(profileImage ?? MyImages.img),
              ),
              const SizedBox(width: 10),
              Text(profilName ?? 'Demet',
                  style: MyTextStyle.lexendButton(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(MyIcons.starIcon, width: 45),
              const SizedBox(width: 5),
              Text(
                tokenNumber ?? '1000',
                style: MyTextStyle.lexendButton(),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
