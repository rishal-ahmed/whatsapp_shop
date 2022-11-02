import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  static final bottomNavProvider = StateProvider<int>((ref) => 0);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final int currentIndex = ref.watch(bottomNavProvider);
        return BottomNavigationBar(
          backgroundColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_outlined,
                color: secondaryColor,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: Color(0XFF8D9BA3),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                color: secondaryColor,
              ),
              icon: Icon(
                Icons.search,
                color: Color(0XFF8D9BA3),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.notifications_outlined,
                color: secondaryColor,
              ),
              icon: Icon(
                Icons.notifications_outlined,
                color: Color(0XFF8D9BA3),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person_outline,
                color: secondaryColor,
              ),
              icon: Icon(
                Icons.person_outline,
                color: Color(0XFF8D9BA3),
              ),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            ref.read(bottomNavProvider.notifier).state = index;
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
      },
    );
  }
}
