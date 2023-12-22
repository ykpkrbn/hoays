import 'package:get/get.dart';
import 'package:hoays/utils/images.dart';

import 'my_story_detail_model.dart';

class MyStoryDetailController extends GetxController {
  RxList<MyStoryDetailModel> details = <MyStoryDetailModel>[].obs;
  
  @override
  void onInit() {
    details.addAll(_fakeStoryList);
    super.onInit();
  }
  
  final List<MyStoryDetailModel> _fakeStoryList = [
    MyStoryDetailModel(photo: MyImages.img1, storyShareDate: DateTime.now(), isStoryLive: true, storyRemainingTime: 23),
    MyStoryDetailModel(photo: MyImages.img, storyShareDate: DateTime(2023,12,12), storyLike:5 ,storySeeCount: 35),
    MyStoryDetailModel(photo: MyImages.img5, storyShareDate: DateTime(2022,05,19), storyDislike: 3, storyLike: 15,storySeeCount: 108),
  ];
  
}
