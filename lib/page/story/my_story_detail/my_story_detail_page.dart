import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/page/story/my_story_detail/my_story_detail_controller.dart';
import 'package:hoays/page/story/my_story_detail/my_story_detail_model.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/utils/textStyle.dart';
import 'package:hoays/widgets/my_button.dart';

class MyStoryDetailPage extends StatelessWidget {
  const MyStoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyStoryDetailController myStoryDetailController =
        Get.put(MyStoryDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hikayelerim',
          style: MyTextStyle.lato(),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            MyStoryDetailModel data = myStoryDetailController.details[index];
            return _buildStory(
              onPressed: () {
                myStoryDetailController.details.elementAt(index);
              },
              data.photo,
              isLive: data.isStoryLive,
              storySeeCount: data.storySeeCount,
              storyShareDate: data.storyShareDate,
              storyLike: data.storyLike,
              storyDislike: data.storyDislike,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: myStoryDetailController.details.length),
    );
  }

  Card _buildStory(
    String photo, {
    bool? isLive,
    int? storySeeCount,
    DateTime? storyShareDate,
    Function()? onPressed,
    int? storyDislike,
    int? storyLike,
  }) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Bu kısım paylaşılan hikayenin ne kadar zamanının kaldığını gösteren kısım
            isLive == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        'Hikaye ${storyShareDate!.hour} saat ${storyShareDate.minute} dakika daha yayınlanacak.',
                        style: MyTextStyle.lexend(fontSize: 10),
                      ),
                      IconButton(
                          onPressed: onPressed,
                          icon: const Icon(Icons.close_rounded))
                    ],
                  )
                : const Text(''),
            isLive == true
                ? const SizedBox(height: 40)
                : const SizedBox(height: 20),

            /// Resim, ne zaman paylaşıldığı, kaç kişi izlediği olan kısım
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: MyColors.orangeColor,
                  radius: 50,
                  backgroundImage: AssetImage(photo),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DateTime.now().hour - storyShareDate!.hour <= 24 &&
                              DateTime.now().day - storyShareDate.day < 1
                          ? Text(
                              '${24 - storyShareDate.hour} saat ${60 - storyShareDate.minute} önce ',
                              style: MyTextStyle.lexend(),
                            )
                          : Text(
                              '${storyShareDate.day} / ${storyShareDate.month} / ${storyShareDate.year}',
                              style: MyTextStyle.lexend(),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: IconButton(
                                tooltip: 'Kaç Kişi izlemiş onları göster',
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.remove_red_eye_outlined)),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Toplamda $storySeeCount kişi baktı',
                              style: MyTextStyle.lexend(fontSize: 12),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            /// Beğenilen beğenilmeyen buton kısmı
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    isCenterTwoWidget: true,
                    icon: Icons.favorite_rounded,
                    text: ' $storyLike',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MyButton(
                    isCenterTwoWidget: true,
                    icon: Icons.heart_broken_rounded,
                    text: ' $storyDislike',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
