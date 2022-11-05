import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/search_product/search_product_event.dart';
import 'package:whatsapp_shop/application/search_product/search_product_state.dart';
import 'package:whatsapp_shop/infrastructure/home/home_repository.dart';

class SearchHomeNotifier extends StateNotifier<Future<SearchProductState>> {
  SearchHomeNotifier() : super(Future.value(SearchProductState.initial()));

  void emit(SearchProductEvent event) {
    event.map(search: (searchEvent) async {
      // Loading
      state =
          Future.value(SearchProductState.initial().copyWith(isLoading: true));

      // Search Product Api
      final result = await HomeRepository().search(
          shopCategoryId: searchEvent.shopCategoryId,
          keyword: searchEvent.keyword);

      final SearchProductState searchProductState = result.fold(
        (l) => SearchProductState.initial().copyWith(isError: true),
        (r) => SearchProductState.initial().copyWith(shops: r),
      );

      // Notify UI
      state = Future.value(searchProductState);
    });
  }
}
