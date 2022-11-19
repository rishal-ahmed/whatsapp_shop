import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product_category/product_category_event.dart';
import 'package:whatsapp_shop/application/product_category/product_category_notifier.dart';
import 'package:whatsapp_shop/application/product_category/product_category_state.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_event.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_notifier.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_state.dart';

class ShopProvider {
  //==--==--==--==--==-- Shop Home --==--==--==--==--==
  static final shopHomeProvider = AutoDisposeStateNotifierProviderFamily<
      ShopHomeNotifier, ShopHomeState, ShopHomeEvent>((ref, event) {
    if (event.shopId == 0) {
      return ShopHomeNotifier();
    }
    return ShopHomeNotifier()..emit(event);
  });

  //==--==--==--==--==-- Shop Product Categories --==--==--==--==--==
  static final productCategoriesProvider =
      AutoDisposeStateNotifierProviderFamily<ProductCategoryNotifier,
          ProductCategoryState, ProductCategoryEvent>((ref, event) {
    return ProductCategoryNotifier()..emit(event);
  });
}
