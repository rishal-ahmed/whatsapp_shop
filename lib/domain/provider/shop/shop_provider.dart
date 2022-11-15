import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product_category/product_category_event.dart';
import 'package:whatsapp_shop/application/product_category/product_category_notifier.dart';
import 'package:whatsapp_shop/application/product_category/product_category_state.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_event.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_notifier.dart';
import 'package:whatsapp_shop/application/shop_home/shop_home_state.dart';

class ShopProvider {
  static final productCategoriesProvider = StateNotifierProvider.family<
      ProductCategoryNotifier,
      ProductCategoryState,
      ProductCategoryEvent>((ref, event) {
    return ProductCategoryNotifier()
      ..emit(ProductCategoryEvent.categories(shopId: event.shopId));
  });

  static final shopHomeProvider = StateNotifierProvider.family<ShopHomeNotifier,
      ShopHomeState, ShopHomeEvent>((ref, event) {
    return ShopHomeNotifier()..emit(event);
  });
}
