import 'package:flutter/material.dart';
import '../data/colors.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menuBackgroundColor,
      body: SafeArea(
          child: SizedBox(
        width: 164,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(bottom: 17),
              padding: const EdgeInsets.only(left: 28),
              height: 40,
              child: Row(
                children: [
                  Image.asset('assets/icons/IC_Home.png'),
                  const SizedBox(
                    width: 22,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 16, color: menuBackgroundColor),
                  )
                ],
              ),
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Profile.png',
              title: 'Profile',
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Location.png',
              title: 'Nearby',
            ),
            const Divider(
              color: Colors.white,
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Bookmark.png',
              title: 'Bookmark',
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Notification_menu.png',
              title: 'Notification',
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Message_menu.png',
              title: 'Message',
            ),
            const Divider(
              color: Colors.white,
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Setting.png',
              title: 'Setting',
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Help.png',
              title: 'Help',
            ),
            const MenuItem(
              icon: 'assets/icons/IC_Logout.png',
              title: 'Logout',
            ),
          ],
        ),
      )),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.title, required this.icon})
      : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 28, bottom: 18, top: 18),
      width: 165,
      child: Row(
        children: [
          Image.asset(icon),
          const SizedBox(
            width: 22,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}
