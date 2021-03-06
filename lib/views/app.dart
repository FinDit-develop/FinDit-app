import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/controllers/app_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:FinDit/views/home/home_screen.dart';
import 'package:FinDit/views/like/like_screen.dart';
import 'package:FinDit/views/mypage/mypage_screen.dart';
import 'package:FinDit/views/store/store_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class App extends GetView<AppController> {
  const App({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    var _navitems = <Map<String, dynamic>>[
      {
        "icon": "assets/icons/home.svg",
        "active_icon": "assets/icons/home_active.svg",
        "title": "HOME"
      },
      {
        "icon": "assets/icons/store.svg",
        "active_icon": "assets/icons/store_active.svg",
        "title": "STORE"
      },
      {
        "icon": "assets/icons/like.svg",
        "active_icon": "assets/icons/like_active.svg",
        "title": "LIKE"
      },
      {
        "icon": "assets/icons/my.svg",
        "active_icon": "assets/icons/my_active.svg",
        "title": "MY"
      },
    ];
    var _view = [
      HomeScreen(),
      StoreScreen(),
      LikeScreen(),
      MyPageScreen(
        user: user,
      )
    ];

    return Scaffold(
        body: Obx(() => _view[controller.currentIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changePageIndex,
            backgroundColor: Colors.white,
            selectedItemColor: kActiveColor,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: List.generate(
              _navitems.length,
              (index) => BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildSvgIcon(
                    src: _navitems[index]['icon'],
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildSvgIcon(
                    src: _navitems[index]['active_icon'],
                  ),
                ),
                //tooltip: _navitems[index]["title"],
                label: _navitems[index]["title"],
              ),
            ),
          ),
        ));
  }

  SvgPicture buildSvgIcon({required String src, bool isActive = false}) {
    return SvgPicture.asset(
      src,
      width: 21,
      height: 21,
    );
  }
}
