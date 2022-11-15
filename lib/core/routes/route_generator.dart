import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/routes/routes.dart';
import 'package:whatsapp_shop/domain/models/address/address_model.dart';
import 'package:whatsapp_shop/presentation/screens/about_us/screen_about_us.dart';
import 'package:whatsapp_shop/presentation/screens/address/screen_add_address.dart';
import 'package:whatsapp_shop/presentation/screens/address/screen_address.dart';
import 'package:whatsapp_shop/presentation/screens/auth/login/screen_login.dart';
import 'package:whatsapp_shop/presentation/screens/auth/register/screen_register.dart';
import 'package:whatsapp_shop/presentation/screens/cart/screen_cart.dart';
import 'package:whatsapp_shop/presentation/screens/home/screen_home.dart';
import 'package:whatsapp_shop/presentation/screens/main/screen_main.dart';
import 'package:whatsapp_shop/presentation/screens/notification/screen_notification.dart';
import 'package:whatsapp_shop/presentation/screens/order/screen_orders.dart';
import 'package:whatsapp_shop/presentation/screens/product/screen_categories.dart';
import 'package:whatsapp_shop/presentation/screens/product/screen_product.dart';
import 'package:whatsapp_shop/presentation/screens/product/screen_products.dart';
import 'package:whatsapp_shop/presentation/screens/profile/screen_edit_profile.dart';
import 'package:whatsapp_shop/presentation/screens/profile/screen_profile.dart';
import 'package:whatsapp_shop/presentation/screens/search/screen_search.dart';
import 'package:whatsapp_shop/presentation/screens/shops/screen_shop.dart';
import 'package:whatsapp_shop/presentation/screens/splash/screen_splash.dart';
import 'package:whatsapp_shop/presentation/screens/support/screen_support.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final Object? args = routeSettings.arguments;

    switch (routeSettings.name) {
      //=-=-=-=-=-=-=-=-=-=- Root -=-=-=-=-=-=-=-=-=-=
      case routeRoot:
        return MaterialPageRoute(builder: (_) => const ScreenSplash());

      //=-=-=-=-=-=-=-=-=-=- Authentication -=-=-=-=-=-=-=-=-=-=
      case routeLogin:
        return MaterialPageRoute(builder: (_) => ScreenLogin());
      case routeRegister:
        return MaterialPageRoute(builder: (_) => ScreenRegister());

      //=-=-=-=-=-=-=-=-=-=- Main -=-=-=-=-=-=-=-=-=-=
      case routeMain:
        if (args is int) {
          return MaterialPageRoute(builder: (_) => ScreenMain(shopId: args));
        }
        return _errorRoute();
      //=-=-=-=-=-=-=-=-=-=- Home -=-=-=-=-=-=-=-=-=-=
      case routeHome:
        return MaterialPageRoute(builder: (_) => const ScreenHome());

      //=-=-=-=-=-=-=-=-=-=- Search -=-=-=-=-=-=-=-=-=-=
      case routeSearch:
        if (args is int) {
          return MaterialPageRoute(builder: (_) => ScreenSearch(shopId: args));
        }
        return _errorRoute();

      //=-=-=-=-=-=-=-=-=-=- Notifications -=-=-=-=-=-=-=-=-=-=
      case routeNotifications:
        return MaterialPageRoute(builder: (_) => const ScreenNotification());

      //=-=-=-=-=-=-=-=-=-=- Profile -=-=-=-=-=-=-=-=-=-=
      case routeProfile:
        return MaterialPageRoute(builder: (_) => const ScreenProfile());
      case routeEditProfile:
        return MaterialPageRoute(builder: (_) => const ScreenEditProfile());

      //=-=-=-=-=-=-=-=-=-=- Shop -=-=-=-=-=-=-=-=-=-=
      case routeShop:
        if (args is int) {
          return MaterialPageRoute(builder: (_) => ScreenShop(shopId: args));
        }
        return _errorRoute();

      //=-=-=-=-=-=-=-=-=-=- Product -=-=-=-=-=-=-=-=-=-=
      case routeProduct:
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => ScreenProduct(productId: args));
        }
        return _errorRoute();

      case routeProducts:
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => ScreenProducts(
                  title: args['title'], products: args['products']));
        }
        return _errorRoute();

      case routeCategories:
        if (args is Map) {
          return MaterialPageRoute(
              builder: (_) => ScreenCategories(
                  title: args['title'], categories: args['categories']));
        }
        return _errorRoute();

      //=-=-=-=-=-=-=-=-=-=- Cart -=-=-=-=-=-=-=-=-=-=
      case routeCart:
        return MaterialPageRoute(builder: (_) => const ScreenCart());

      //=-=-=-=-=-=-=-=-=-=- Address -=-=-=-=-=-=-=-=-=-=
      case routeAddress:
        return MaterialPageRoute(builder: (_) => const ScreenAddress());

      case routeAddAddress:
        if (args is AddressModel) {
          return MaterialPageRoute(
              builder: (_) => ScreenAddAddress(addressModel: args));
        }
        return MaterialPageRoute(builder: (_) => const ScreenAddAddress());

      //=-=-=-=-=-=-=-=-=-=- Order -=-=-=-=-=-=-=-=-=-=
      case routeOrder:
        return MaterialPageRoute(builder: (_) => const ScreenOrders());

      //=-=-=-=-=-=-=-=-=-=- Support -=-=-=-=-=-=-=-=-=-=
      case routeSupport:
        return MaterialPageRoute(builder: (_) => const ScreenSupport());

      //=-=-=-=-=-=-=-=-=-=- About Us -=-=-=-=-=-=-=-=-=-=
      case routeAboutUs:
        return MaterialPageRoute(builder: (_) => const ScreenAboutUs());

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
