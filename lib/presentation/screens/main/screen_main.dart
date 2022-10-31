import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/core/constants/sizes.dart';
import 'package:whatsapp_shop/presentation/screens/notification/screen_notification.dart';
import 'package:whatsapp_shop/presentation/screens/personal_information/screen_personal_information.dart';
import 'package:whatsapp_shop/presentation/screens/shops/screen_shops1.dart';
import 'package:whatsapp_shop/presentation/widgets/home_bottom_navigation_bar.dart';

import '../product_pages/screen_productlisting.dart';

const List _pages = [
  ScreenShop1(),
  ScreenProductListing(),
  ScreenNotification(),
  ScreenPersonalInformation(),
];

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  static final ValueNotifier<int> bottomNavNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: bottomNavNotifier,
        builder: (context, int index, _) {
          return Scaffold(
            appBar: AppBar(
              shadowColor: buttonTextColor,
              backgroundColor: primaryColor,
              leading: const Icon(
                Icons.menu,
                color: appbarTextColor,
              ),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.whatsapp,
                    color: secondaryTextColor,
                    size: 24,
                  ),
                  kWidth10,
                  Text(
                    'WhatsAppShop',
                    style: TextStyle(
                      color: appbarTextColor,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.shopping_cart),
                )
              ],
            ),
            body: _pages[index],
            bottomNavigationBar: const HomeBottomNavigationBar(),
          );
        });
  }
}
