import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
import 'package:whatsapp_shop/presentation/screens/main/screen_main.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: buttonTextColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: buttonTextColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: buttonTextColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: buttonTextColor,
          ),
          label: '',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        ScreenMain.bottomNavNotifier.value = index;
      },
      selectedFontSize: 13,
      selectedIconTheme:
          const IconThemeData(color: secondaryTextColor, size: 14),
      selectedItemColor: secondaryTextColor,
    );
  }
}
