import 'package:FinDit/models/search_video_result.dart';
import 'package:FinDit/services/youtube_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  String loadkey = "데일리룩";
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad(loadkey);
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPagetoken != "") {
        _videoLoad(loadkey);
      }
    });
  }

  void _videoLoad(String loadkey) async {
    var youtubeVideoResult = await YoutubeService.to
        .loadVideos(loadkey, youtubeResult.value.nextPagetoken ?? "");

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items.isNotEmpty) {
      youtubeResult.update((youtube) {
        youtube!.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube.items.addAll(youtubeVideoResult.items);
      });
    }
  }
}
