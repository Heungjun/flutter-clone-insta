import 'package:flutter/material.dart';
import 'package:flutter_clone/src/components/imagepath.dart';
import 'package:flutter_clone/src/controller/BottomNavController.dart';
import 'package:flutter_clone/src/pages/home.dart';
import 'package:flutter_clone/src/pages/search.dart';
import 'package:get/get.dart';
import 'components/image_data.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            // index: controller.pageIndex.value,
            index: 1,
            children: [
              const Home(),
              Navigator(
                  key: controller.searchPageNavigationKey,
                  onGenerateRoute: (routeSetting) {
                    return MaterialPageRoute(
                        builder: (context) => const Search());
                  }),
              Container(
                child: Center(child: Text('UPLOAD')),
              ),
              Container(
                child: Center(child: Text('ACTIVITY')),
              ),
              Container(
                child: Center(child: Text('MYPAGE')),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.uploadIcon),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'home',
              ),
            ],
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
