import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/commons/search_bar.dart';
import 'package:hoays/commons/user_filtre.dart';
import 'package:hoays/commons/user_story/user_story.dart';
import 'package:hoays/model/user_model.dart';
import 'package:hoays/page/home/home_controller.dart';
import 'package:hoays/page/home/messages/messages_page.dart';
import 'package:hoays/page/home/users/users_page.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/widgets/appbar.dart';
import 'package:hoays/widgets/my_button2.dart';

import '../../commons/user_story/other_user_story.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MyAppBar(title: 'Ana Sayfa'),
          const SizedBox(height: 15),

          /// Arama Çubuğu
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MySearchBar(),
          ),
          const SizedBox(height: 15),

          /// Hikaye - Story paylaşan insanların bulunduğu kısım
          SizedBox(
            height: 108,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: homeController.users.length,
              itemBuilder: (context, index) {
                UserModel user = homeController
                    .users[Random().nextInt(homeController.users.length)];
                if (index == 0) {
                  /// İlk eleman sabit
                  return const MyUserStory();
                } else {
                  /// Diğer elemanlar rastgele
                  return OtherUserStory(
                      userPhoto: user.userPhoto, userName: user.userName);
                }
              },
            ),
          ),
          const Divider(),

          /// Burası Kaç Kullanıcı var ve Filtreleme Kullanılan ALan
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: MyUserFilter(isSort: true)),

          /// Mesaj Atılacak Kişileri Gösterir
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                shrinkWrap: true,
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
                  } else if (index < 4) {
                    if (index == 3) {
                      return MyButton2(
                        buttonText: 'Get More Messages',
                        isRightImage: true,
                        onPressed: () {
                          Get.to(() => UsersPage());
                        },
                      );
                    } else {
                      return ListTile(
                        onTap: () {
                          Get.to(() => MessagesPage(
                                userName: user.userName,
                                userPhoto: user.userPhoto,
                                bio: user.bio,
                              ));
                        },
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundColor: MyColors.orangeColor,
                          child: Image.asset(user.userPhoto),
                        ),
                        title: Text(user.userName),
                        subtitle: Text('Bio: ${user.bio}'),
                      );
                    }
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
