import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hoays/commons/user_story/other_user_story.dart';
import 'package:hoays/commons/user_story/user_story.dart';
import 'package:hoays/page/story/my_story_detail/my_story_detail_page.dart';

import '../../commons/search_bar.dart';
import '../../commons/user_filtre.dart';
import '../../model/user_model.dart';
import '../../utils/icons.dart';
import '../../utils/textStyle.dart';
import '../home/home_controller.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(MyIcons.chatIcon)),
                Expanded(
                  child: Text(
                    'Hikayeler',
                    textAlign: TextAlign.center,
                    style: MyTextStyle.lato(),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showPopupMenu(context);
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.more_vert_rounded),
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MySearchBar(),
            ),
            const SizedBox(height: 15),

            /// Burası Kaç Kullanıcı var ve Filtreleme Kullanılan ALan
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: MyUserFilter(
                  isSort: false,
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, mainAxisSpacing: 10),
                  itemCount: homeController.users.length,
                  itemBuilder: (context, index) {
                    // UserModel user = homeController
                    //     .users[Random().nextInt(homeController.users.length)];
                    UserModel user = homeController.users[index];
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showPopupMenu(BuildContext context) {
    // Creating items for the popup menu
    List<PopupMenuEntry<String>> items = [
      PopupMenuItem<String>(
        onTap: () {},
        value: 'StoryShare',
        child: const Text('Hikaye Paylaş Amk'),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        onTap: () {
          Get.to(()=>MyStoryDetailPage());
        },
        value: 'MyStory',
        child: const Text('Hikayelerim'),
      ),
    ];

    // Show the popup menu and handle the selected value
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 0),
      items: items,
      elevation: 8,
    ).then((String? value) {
      if (value != null) {
        // Handle the selected value here
        print('Selected option: $value');
      }
    });
  }
}
