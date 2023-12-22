import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoays/model/user_model.dart';
import 'package:hoays/utils/images.dart';
import 'package:hoays/utils/textStyle.dart';

class HomeController extends GetxController {
  late TextEditingController searchEditingCtrl;
  late FocusNode focusNode;

  RxList<UserModel> users = <UserModel>[].obs;

  /// Burası Filtre Kısmı
  RxDouble age = 20.0.obs;
  RxInt selectedOptionsGender = 1.obs;
  RxInt selectedOptionStory = 1.obs;
  RxString countryValue = "*Ülke".obs;
  RxString stateValue = "*İl".obs;
  RxString cityValue = "*İlçe".obs;

  @override
  void onInit() {
    searchEditingCtrl = TextEditingController();
    focusNode = FocusNode();
    users.addAll(_fakeUserList);
    super.onInit();
  }

  @override
  void dispose() {
    searchEditingCtrl.dispose();
    super.dispose();
  }

  Future<void> userGetList() async {
    await Future.delayed(const Duration(seconds: 1));
    users;
  }

  static final List<String> _fakeBio = [
    'Lorem ipsum',
    'Eşkiya',
    'Döğüşen Horozcu',
    'Full Stack Developer',
    'Barbie Sevenler Derneği',
    'Gülü Sevdim Dikeni Battı, Seni Sevdim Götün mü Kalktı?',
    'Nereye dönersen dön, Götün her zaman arkandadır',
    'Ye Kebabı İç Şarabı Vur Kapuzu Göte'
  ];

  final List<UserModel> _fakeUserList = [
    UserModel(userPhoto: MyImages.img1, userName: 'Cam35', bio: _fakeBio[0]),
    UserModel(userPhoto: MyImages.img2, userName: 'Nicolas', bio: _fakeBio[1]),
    UserModel(userPhoto: MyImages.img3, userName: 'Roger', bio: _fakeBio[2]),
    UserModel(userPhoto: MyImages.img4, userName: 'Byneo', bio: _fakeBio[3]),
    UserModel(userPhoto: MyImages.img5, userName: 'Asadas', bio: _fakeBio[4]),
    UserModel(userPhoto: MyImages.img6, userName: 'Ahmet', bio: _fakeBio[5]),
    UserModel(userPhoto: MyImages.img7, userName: 'Gizem', bio: _fakeBio[6]),
    UserModel(userPhoto: MyImages.img8, userName: 'Mahmut', bio: _fakeBio[7]),
  ];

  /// Filtrelemelerde bulunan yeri kontrol edip kaydetmeyi sağlar
  void filterSaved() {
    if (countryValue.value.trim().isNotEmpty &&
        countryValue.value.trim() != '*Ülke' &&
        stateValue.value.trim().isNotEmpty &&
        stateValue.value.trim() != '*İl' &&
        cityValue.value.trim().isNotEmpty &&
        cityValue.value.trim() != '*İlçe') {
      Get.back();
      Get.showSnackbar(GetSnackBar(
        title: 'Başarılı',
        messageText: Text('Başarılı', style: MyTextStyle.lato()),
        duration: Durations.extralong4,
        borderRadius: 12,
        padding: const EdgeInsets.all(12),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
      ));
      countryReset();
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'Eksik Kısımları Doldurun',
        messageText: Text('Tekrar Bak Kanka', style: MyTextStyle.lato()),
        duration: Durations.extralong4,
        borderRadius: 12,
        padding: const EdgeInsets.all(12),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      ));
    }
  }

  void countryReset() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        countryValue.value = '*Ülke';
        stateValue.value = '*İl';
        cityValue.value = '*İlçe';
      },
    );
  }
}
