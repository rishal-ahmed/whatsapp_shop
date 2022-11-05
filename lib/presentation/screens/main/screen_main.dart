import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/presentation/screens/home/screen_home.dart';
import 'package:whatsapp_shop/presentation/screens/main/widgets/main_bottom_nav.dart';
import 'package:whatsapp_shop/presentation/screens/main/widgets/main_drawer.dart';
import 'package:whatsapp_shop/presentation/screens/notification/screen_notification.dart';
import 'package:whatsapp_shop/presentation/screens/profile/pages/screen_profile.dart';
import 'package:whatsapp_shop/presentation/screens/search/screen_search.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';

const List _pages = [
  ScreenHome(),
  ScreenSearch(),
  ScreenNotification(),
  ScreenProfile(),
];

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: const AppBarWidget(defualt: true),
      body: Consumer(
        builder: (context, ref, child) {
          final int index =
              ref.watch(MainBottomNavigationBar.bottomNavProvider);
          return _pages[index];
        },
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
