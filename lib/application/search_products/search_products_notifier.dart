import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/search_products/search_products_event.dart';
import 'package:whatsapp_shop/application/search_products/search_products_state.dart';
import 'package:whatsapp_shop/infrastructure/product/product_repository.dart';

class SearchProductNotifier extends StateNotifier<SearchProductsState> {
  SearchProductNotifier() : super(SearchProductsState.initial());

  void emit(SearchProductsEvent event) {
    event.map(search: (searchEvent) async {
      // Loading
      state = SearchProductsState.initial().copyWith(isLoading: true);

      // Search Product Api
      final result = await ProductRepository().searchProducts(
        shopId: searchEvent.shopId,
        categoryId: event.categoryId,
        keyword: searchEvent.keyword,
      );

      final SearchProductsState searchProductsState = result.fold(
        (failure) => SearchProductsState.initial().copyWith(isError: true),
        (success) => SearchProductsState.initial().copyWith(products: success),
      );

      // Notify UI
      state = searchProductsState;
    });
  }
}
