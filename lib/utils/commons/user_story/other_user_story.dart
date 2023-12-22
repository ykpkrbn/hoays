import 'package:flutter/material.dart';

import '../../colors.dart';

/// Bu Sınıf Diğer Kullanıcıların Storyleri
class OtherUserStory extends StatelessWidget {
  final String userPhoto;
  final String userName;

  const OtherUserStory(
      {super.key, required this.userPhoto, required this.userName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: MyColors.orangeColor,
                radius: 35,
                child: Image.asset(userPhoto),
              ),
            ),
            const SizedBox(height: 5),
            Text(userName),
          ],
        ),
      ),
    );
  }
}
