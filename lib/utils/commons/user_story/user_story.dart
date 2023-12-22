import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../widgets/my_button.dart';
import '../../colors.dart';
import '../../icons.dart';
import '../../images.dart';
import '../../textStyle.dart';

/// Bu Sınıf Benim Storylere giden kısım
class MyUserStory extends StatelessWidget {
  const MyUserStory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          showDragHandle: true,
          context: context,
          builder: (context) {
            return buildSheet();
          },
        );
        print('Story Ekle');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: MyColors.orangeColor,
                    radius: 35,
                    child: Image.asset(MyImages.img),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue),
                      child: const Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text('Votre Story'),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Hikaye Paylaş', style: MyTextStyle.poppins()),
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {},
                child: Column(
                  children: [
                    SvgPicture.asset(MyIcons.cameraIcon),
                    const SizedBox(height: 20),
                    Text(
                      'Resim Çek',
                      style: MyTextStyle.lexend(),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {},
                child: Column(
                  children: [
                    SvgPicture.asset(MyIcons.photoIcon),
                    const SizedBox(height: 20),
                    Text(
                      'Galeriden Seç',
                      style: MyTextStyle.lexend(),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: MyButton(
              text: 'Devam Et',
              onPressed: () {
                Get.back();
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
