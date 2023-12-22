import 'package:flutter/material.dart';
import 'package:hoays/utils/textStyle.dart';
import 'package:hoays/widgets/appbar2.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_button3.dart';
import '../../widgets/my_button4.dart';

class TokenWinPage extends StatelessWidget {
  final ImageProvider<Object>? backgroundImage;

  const TokenWinPage({super.key, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MyAppBar2(title: 'Jeton Kazan'),
              const SizedBox(height: 25),
              CircleAvatar(
                maxRadius: 64,
                minRadius: 40,
                backgroundColor: MyColors.orangeColor,
                backgroundImage:
                    backgroundImage ?? const AssetImage(MyImages.img),
              ),
              const SizedBox(height: 40),
              Text(
                'Jetonlarım:',
                style:
                    MyTextStyle.lexend(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              MyButton3(
                onPressed: () {},
                buttonText: '766',
              ),
              const SizedBox(height: 5),
              Text(
                'Günde 1 kere',
                style:
                    MyTextStyle.lexend(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    _buildCardReklam(onPressed: () {}),
                    const SizedBox(width: 5),
                    _buildCardReklam(
                        onPressed: () {},
                        title: 'İzle ve Kazan',
                        buttonText: 'İzle',
                        subTitle: '0/3'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              MyButton4(
                onPressed: () {},
                buttonText: 'Günün İlk Sorusu',
                buttonText2: '7',
              ),
              const SizedBox(height: 10),
              MyButton4(
                onPressed: () {},
                buttonText: 'Günde 20 hikaye',
                buttonText2: '0',
              ),
              const SizedBox(height: 10),
              MyButton4(
                onPressed: () {},
                buttonText: 'Günde 10 farklı yeni sohbet',
                buttonText2: '0',
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: MyButton(
                  onPressed: () {},
                  text: 'Jetonları Öne Çıkar',
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// Bu kısım Reklam göstererek veya Jeton satın alınarak uygulanan yer
  Expanded _buildCardReklam({
    String? title,
    String? buttonText,
    String? subTitle,
    Function()? onPressed,
  }) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              title ?? 'Günlük Kazan',
              style:
                  MyTextStyle.lexend(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            MyButton3(
              height: 34,
              onPressed: onPressed,
              isIconSeen: false,
              color: MyColors.orangeColor,
              buttonText: buttonText ?? 'Al',
            ),
            const SizedBox(height: 5),
            Text(
              subTitle ?? 'Günde 1 kere',
              style:
                  MyTextStyle.lexend(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
