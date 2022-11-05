import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/presentation/screens/auth/login/screen_login.dart';
import 'package:whatsapp_shop/presentation/screens/auth/register/screen_register.dart';
import 'package:whatsapp_shop/presentation/screens/home/screen_home.dart';
import 'package:whatsapp_shop/presentation/screens/main/screen_main.dart';
import 'package:whatsapp_shop/presentation/screens/notification/screen_notification.dart';
import 'package:whatsapp_shop/presentation/screens/profile/pages/screen_edit_profile.dart';
import 'package:whatsapp_shop/presentation/screens/profile/pages/screen_profile.dart';
import 'package:whatsapp_shop/presentation/screens/search/screen_search.dart';
import 'package:whatsapp_shop/presentation/screens/splash/screen_splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    // final Object? args = routeSettings.arguments;

    switch (routeSettings.name) {
      //==================== Root ====================
      case routeRoot:
        return MaterialPageRoute(builder: (_) => const ScreenSplash());

      //==================== Authentication ====================
      case routeLogin:
        return MaterialPageRoute(builder: (_) => ScreenLogin());
      case routeRegister:
        return MaterialPageRoute(builder: (_) => ScreenRegister());

      //==================== Main ====================
      case routeMain:
        return MaterialPageRoute(builder: (_) => const ScreenMain());

      //==================== Home ====================
      case routeHome:
        return MaterialPageRoute(builder: (_) => const ScreenHome());

      //==================== Search ====================
      case routeSearch:
        return MaterialPageRoute(builder: (_) => const ScreenSearch());

      //==================== Notifications ====================
      case routeNotifications:
        return MaterialPageRoute(builder: (_) => const ScreenNotification());

      //==================== Profile ====================
      case routeProfile:
        return MaterialPageRoute(builder: (_) => const ScreenProfile());
      case routeEditProfile:
        return MaterialPageRoute(builder: (_) => const ScreenEditProfile());

      default:
        return _errorRoute();
    }
  }

  //========== Error Page if Navigation goes wrong ==========
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text(
            'Error',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
