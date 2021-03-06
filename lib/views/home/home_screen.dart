import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/controllers/home_controller.dart';
import 'package:FinDit/views/home/components/banner.dart';
import 'package:FinDit/views/home/components/categories.dart';
import 'package:FinDit/views/video_detail/video_detail_screen.dart';
import 'package:FinDit/views/widgets/appbar.dart';
import 'package:FinDit/views/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: buildAppBar(),
                floating: true,
                snap: false,
                //pinned: true,
                titleSpacing: 0,
              ),
              const SliverToBoxAdapter(
                child: BannerWidget(),
              ),
              const SliverToBoxAdapter(
                  child: Padding(
                padding:
                    EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 10),
                child: Text("Today's LookBook ", style: kTitleTextStyle),
              )),
              SliverAppBar(
                title: Categories(),
                floating: false,
                snap: false,
                pinned: true,
                toolbarHeight: 50,
                titleSpacing: 0,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            "/detail/${controller.youtubeResult.value.items[index].id!.videoId}");
                      },
                      child: VideoWidget(
                          video: controller.youtubeResult.value.items[index]),
                    );
                  },
                  childCount: controller.youtubeResult.value.items.length,
                ),
              ),
            ],
          )),
    );
  }
}
