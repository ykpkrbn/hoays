import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class MessagesPage extends StatelessWidget {
  final String userName;
  final String userPhoto;
  final String? bio;

  const MessagesPage(
      {super.key, required this.userName, required this.userPhoto, this.bio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: MyColors.orangeColor,
                  child: Image.asset(userPhoto))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('Kullanıcının Bio: $bio'), TextFormField()],
        ),
      ),
    );
  }
}
