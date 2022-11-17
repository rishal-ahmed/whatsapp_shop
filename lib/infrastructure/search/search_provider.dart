import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/search_products/search_products_notifier.dart';
import 'package:whatsapp_shop/application/search_products/search_products_state.dart';

class SearchProvider {
  //==--==--==--==--==-- Search Product --==--==--==--==--==
  static final searchProductProvider = StateNotifierProvider.autoDispose<
      SearchProductNotifier, SearchProductsState>((ref) {
    return SearchProductNotifier();
  });

  //==--==--==--==--==-- Search Query --==--==--==--==--==
  static final searchQueryProvider =
      StateProvider.autoDispose<String?>((ref) => null);
}
