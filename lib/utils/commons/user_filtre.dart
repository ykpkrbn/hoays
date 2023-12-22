import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hoays/utils/colors.dart';
import 'package:hoays/widgets/my_button.dart';

import '../../page/home/home_controller.dart';
import '../icons.dart';
import '../textStyle.dart';

class MyUserFilter extends StatelessWidget {
  final bool isSort;

  const MyUserFilter({super.key, this.isSort = false});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(MyIcons.smileyMaskIcon),
            const SizedBox(width: 5),
            Text('${homeController.users.length} Kullanıcı')
          ],
        ),
        Row(
          children: [
            isSort
                ? IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(MyIcons.sortAscendingThinIcon))
                : const Text(''),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return categoryFilter(homeController);
                    },
                  );
                },
                icon: SvgPicture.asset(MyIcons.filterLineIcon)),
          ],
        )
      ],
    );
  }

  Widget categoryFilter(HomeController homeController) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      padding: const EdgeInsets.all(21),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yaş', style: MyTextStyle.publicSans()),
            const SizedBox(height: 5),
            Obx(() {
              return Slider(
                activeColor: MyColors.orangeColor,
                min: 15,
                max: 60,
                value: homeController.age.value,
                onChanged: (newAge) {
                  homeController.age.value = newAge;
                },
              );
            }),
            Obx(() {
              return Text(
                '${homeController.age.value.truncate()}',
                style: MyTextStyle.publicSans(
                    fontWeight: FontWeight.w400, fontSize: 12),
              );
            }),
            const SizedBox(height: 25),
            Text('Cinsiyet', style: MyTextStyle.publicSans()),
            const SizedBox(height: 5),
            Obx(() {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: 1,
                      title: Text(
                        'Kadın',
                        style: MyTextStyle.publicSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      groupValue: homeController.selectedOptionsGender.value,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (selectVal) {
                        homeController.selectedOptionsGender.value =
                            selectVal as int;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: 2,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Erkek',
                        style: MyTextStyle.publicSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      groupValue: homeController.selectedOptionsGender.value,
                      onChanged: (selectVal) {
                        homeController.selectedOptionsGender.value =
                            selectVal as int;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: 3,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Other',
                        style: MyTextStyle.publicSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      groupValue: homeController.selectedOptionsGender.value,
                      onChanged: (selectVal) {
                        homeController.selectedOptionsGender.value =
                            selectVal as int;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: 4,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Hepsi',
                        style: MyTextStyle.publicSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      groupValue: homeController.selectedOptionsGender.value,
                      onChanged: (selectVal) {
                        homeController.selectedOptionsGender.value =
                            selectVal as int;
                      },
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 25),
            Text('Hikaye', style: MyTextStyle.publicSans()),
            const SizedBox(height: 5),
            Obx(() {
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: 1,
                      title: Text(
                        'Instant',
                        style: MyTextStyle.publicSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      groupValue: homeController.selectedOptionStory.value,
                      onChanged: (selectVal) {
                        homeController.selectedOptionStory.value =
                            selectVal as int;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile.adaptive(
                      value: 2,
                      title: Text(
                        'Hepsi',
                        style: MyTextStyle.publicSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      groupValue: homeController.selectedOptionStory.value,
                      onChanged: (selectVal) {
                        homeController.selectedOptionStory.value =
                            selectVal as int;
                      },
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 25),
            Text('Konum Seç', style: MyTextStyle.publicSans()),
            const SizedBox(height: 5),
            Obx(() {
              return CSCPicker(
                showStates: true,
                showCities: true,
                flagState: CountryFlag.ENABLE,
                dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: MyColors.orangeColor, width: 1)),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                countrySearchPlaceholder: "Ülke Seç Kanka - İngilizce Çıkıyor",
                stateSearchPlaceholder: "İl Seç Kanka",
                citySearchPlaceholder: "İlçe Seç Kanka",

                countryDropdownLabel: homeController.countryValue.value,
                stateDropdownLabel: homeController.stateValue.value,
                cityDropdownLabel: homeController.cityValue.value,

                ///Dialog box radius [OPTIONAL PARAMETER]
                dropdownDialogRadius: 10.0,

                ///Search bar radius [OPTIONAL PARAMETER]
                searchBarRadius: 10.0,

                ///triggers once country selected in dropdown
                onCountryChanged: (value) {
                  Future.delayed(
                    Durations.extralong1,
                    () {
                      homeController.countryValue.value = value;
                    },
                  );
                },

                ///triggers once state selected in dropdown
                onStateChanged: (value) {
                  ///store value in state variable
                  Future.delayed(
                    Durations.extralong1,
                    () {
                      homeController.stateValue.value = value ?? '';
                    },
                  );
                },

                ///triggers once city selected in dropdown
                onCityChanged: (value) {

                  ///store value in city variable
                  Future.delayed(
                    Durations.extralong1,
                    () {
                      homeController.cityValue.value = '';
                      homeController.cityValue.value = value ?? '';
                    },
                  );
                },
              );
            }),
            const SizedBox(height: 25),
            Obx(() {
              return Text(
                  '${homeController.countryValue.value} / ${homeController.stateValue.value} / ${homeController.cityValue.value}');
            }),
            const SizedBox(height: 25),
            MyButton(
              text: 'Kaydet',
              onPressed: () {
                homeController.filterSaved();
              },
            ),
          ],
        ),
      ),
    );
  }
}
