import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/presentation/screens/auth/login/screen_login.dart';
import 'package:whatsapp_shop/presentation/screens/auth/register/screen_register.dart';
import 'package:whatsapp_shop/presentation/screens/home/screen_home.dart';
import 'package:whatsapp_shop/presentation/screens/main/screen_main.dart';
import 'package:whatsapp_shop/presentation/screens/splash/screen_splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    // final Object? args = routeSettings.arguments;

    switch (routeSettings.name) {
      //==================== Root ====================
      case routeRoot:
        return MaterialPageRoute(builder: (_) => const ScreenSplash());

      //==================== Main ====================
      case routeMain:
        return MaterialPageRoute(builder: (_) => const ScreenMain());

      //==================== Home ====================
      case routeHome:
        return MaterialPageRoute(builder: (_) => const ScreenHome());

      //==================== Authentication ====================
      case routeLogin:
        return MaterialPageRoute(builder: (_) => ScreenLogin());
      case routeRegister:
        return MaterialPageRoute(builder: (_) => ScreenRegister());

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
