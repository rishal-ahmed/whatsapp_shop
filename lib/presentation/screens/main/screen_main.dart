import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/presentation/screens/main/widgets/main_bottom_nav.dart';
import 'package:whatsapp_shop/presentation/screens/main/widgets/main_drawer.dart';
import 'package:whatsapp_shop/presentation/screens/notification/screen_notification.dart';
import 'package:whatsapp_shop/presentation/screens/profile/screen_profile.dart';
import 'package:whatsapp_shop/presentation/screens/search/screen_search.dart';
import 'package:whatsapp_shop/presentation/screens/shops/screen_shop.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key, required this.shopId});

  final int shopId;

  @override
  Widget build(BuildContext context) {
    final List pages = [
      ScreenShop(shopId: shopId),
      ScreenSearch(shopId: shopId),
      const ScreenNotification(),
      const ScreenProfile(),
    ];
    return Scaffold(
      appBar: const AppBarWidget(defualt: true, isDrawer: true),
      drawer: const MainDrawer(),
      body: Consumer(
        builder: (context, ref, child) {
          final int index =
              ref.watch(MainBottomNavigationBar.bottomNavProvider);
          return pages[index];
        },
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
