import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/page/home/home_controller.dart';
import '../../../model/user_model.dart';
import '../../../utils/colors.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcılar'),
      ),
      body: ListView.separated(
        itemCount: homeController.users.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemBuilder: (context, index) {
          UserModel user = homeController
              .users[Random().nextInt(homeController.users.length)];
          if (index == homeController.users.length - 1) {
            return const SizedBox(height: 130);
          } else {
            return ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 35,
                backgroundColor: MyColors.orangeColor,
                child: Image.asset(user.userPhoto),
              ),
              title: Text(user.userName),
              subtitle: Text('Bio: ${user.bio}'),
            );
          }
        },
      ),
    );
  }
}
