import 'package:flutter/material.dart';
import 'package:project_dkriya/helper/my_color.dart';
import 'package:project_dkriya/pages/home/homepage.dart';
import 'package:project_dkriya/pages/home/notification_page.dart';
import 'package:project_dkriya/pages/home/profile_page.dart';
import 'package:project_dkriya/pages/home/video_page.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentMenu = 0;

  Widget containerWidget() {
    switch (currentMenu) {
      case 0:
        return HomePage();
      case 1:
        return VideoPage();
      case 2:
        return Notifikasi();
      case 3:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentMenu,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            debugPrint("Current Menu ${value}");
            setState(() {
              currentMenu = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_home.png",
                  width: 35,
                  height: 35,
                  color: currentMenu == 0 ? MyColor.primaryColor : Colors.grey,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_video.png",
                  width: 35,
                  height: 35,
                  color: currentMenu == 1 ? MyColor.primaryColor : Colors.grey,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_notification.png",
                  width: 35,
                  height: 35,
                  color: currentMenu == 2 ? MyColor.primaryColor : Colors.grey,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon_profile.png",
                  width: 35,
                  height: 35,
                  color: currentMenu == 3 ? MyColor.primaryColor : Colors.grey,
                ),
                label: ""),
          ]),
      body: containerWidget(),
    );
  }
}
