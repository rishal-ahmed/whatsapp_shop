import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/product/product_event.dart';
import 'package:whatsapp_shop/application/product/product_notifier.dart';
import 'package:whatsapp_shop/application/product/product_state.dart';

class ProductProvider {
  //==--==--==--==--==-- Product --==--==--==--==--==
  static final productProvider = AutoDisposeStateNotifierProviderFamily<
      ProductNotifier, ProductState, ProductEvent>((ref, event) {
    return ProductNotifier()..emit(event);
  });

  //==--==--==--==--==-- Quantity --==--==--==--==--==
  static final quantityProvider = StateProvider.autoDispose<int>((ref) {
    return 1;
  });
}
