import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product_category/product_category_event.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_event.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_state.dart';
import 'package:whatsapp_shop/domain/provider/shop/shop_provider.dart';
import 'package:whatsapp_shop/presentation/screens/main/widgets/main_bottom_nav.dart';
import 'package:whatsapp_shop/presentation/screens/main/widgets/main_drawer.dart';
import 'package:whatsapp_shop/presentation/screens/notification/screen_notification.dart';
import 'package:whatsapp_shop/presentation/screens/profile/screen_profile.dart';
import 'package:whatsapp_shop/presentation/screens/search/screen_search.dart';
import 'package:whatsapp_shop/presentation/screens/shops/screen_shop.dart';
import 'package:whatsapp_shop/presentation/widgets/appbar/appbar.dart';

class ScreenMain extends ConsumerWidget {
  const ScreenMain({super.key, required this.shopId});

  final int shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopHomeState state = ref.watch(
        ShopProvider.shopHomeProvider(ShopHomeEvent.shopHome(shopId: shopId)));

    final productCategoryState =
        ref.watch(ShopProvider.productCategoriesProvider(
      ProductCategoryEvent.categories(shopId: shopId),
    ));
    final List pages = [
      ScreenShop(
        shopId: shopId,
        state: state,
        productCategoryState: productCategoryState,
      ),
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
