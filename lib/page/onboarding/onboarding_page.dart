import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoays/page/onboarding/onboarding_controller.dart';
import 'package:hoays/utils/icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardController onboardController = Get.put(OnboardController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: onboardController.geriButton(),
        actions: [onboardController.skipButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(MyIcons.hoaysIcons),
            SizedBox(
              height: Get.size.height * 0.65,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: PageView.builder(
                      itemCount: onboardController.onboardData.length,
                      onPageChanged: onboardController.currentIndex.call,
                      controller: onboardController.pageController,
                      itemBuilder: (_, index) {
                        var data = onboardController.onboardData[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(data.image, fit: BoxFit.fitWidth),
                            const SizedBox(height: 1),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                Text(
                                  data.desc,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(height: 1),
                          ],
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: onboardController.pageController,
                      count: onboardController.onboardData.length,
                      effect: const ExpandingDotsEffect(
                          activeDotColor: MyColors.titleColor,
                          paintStyle: PaintingStyle.fill,
                          dotColor: MyColors.grayColor
                        ),
                    ),
                  ),
                ],
              ),
            ),
            onboardController.devamEtButton(),
          ],
        ),
      ),
    );
  }
}
