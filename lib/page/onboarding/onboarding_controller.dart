import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/page/auth/login.dart';
import '../../utils/images.dart';
import '../../utils/texts.dart';
import '../../widgets/my_button.dart';
import 'onboard_model.dart';

class OnboardController extends GetxController {
  late PageController pageController;

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  //////////////////////////////////////////////////////////////////////////////////

  /// Geri Butonu
  void backPageFonksiyon() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linearToEaseOut);
  }

  /// Geri Buton Yazısı
  Obx geriButton() {
    return Obx(() => currentIndex.value == 0
        ? const Text('')
        : TextButton(
            onPressed: () {
              backPageFonksiyon();
            },
            child: const Text(MyText.backText)));
  }


  //////////////////////////////////////////////////////////////////////////////////
  /// Sonraki Sayfaya Geçiş Butonu
  void nextPageFonksiyon() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linearToEaseOut);
  }

  /// Sonraki Sayfaya Geçiş Buton Yazısı
  Obx devamEtButton() {
    return Obx(
      () => currentIndex.value == 2
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  size: Get.size.width * 0.2,
                  color: Colors.white,
                  text: MyText.skipText,
                  onPressed: () {
                    skipPageFonksiyon();
                  },
                ),
                MyButton(
                  size: Get.size.width * 0.7,
                  text: MyText.continueText,
                  onPressed: () {
                    nextPageFonksiyon();
                    currentIndex.value == 2
                        ? skipPageFonksiyon()
                        : nextPageFonksiyon();
                  },
                ),
              ],
            )
          : MyButton(
              text: MyText.continueText,
              onPressed: () {
                nextPageFonksiyon();
              },
            ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////////

  /// Atla Butonu
  void skipPageFonksiyon() {
    Get.to(const LoginPage());
  }

  /// Atla Butonu Yazısı
  Obx skipButton() {
    return Obx(() => currentIndex.value == 2
        ? const Text('')
        : TextButton(
        onPressed: () {
          skipPageFonksiyon();
        },
        child: const Text(MyText.skipText)));
  }

  /// Onboard Sayfasında gösterilecek Yapı
  List<OnboardModel> onboardData = [
    OnboardModel(
        image: MyImages.onboard1,
        title: MyText.onboardTitle,
        desc: MyText.onboardDesc),
    OnboardModel(
        image: MyImages.onboard2,
        title: MyText.onboardTitle2,
        desc: MyText.onboardDesc2),
    OnboardModel(
        image: MyImages.onboard3,
        title: MyText.onboardTitle3,
        desc: MyText.onboardDesc3),
  ];
}
