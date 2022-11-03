import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/search_home/search_home_event.dart';
import 'package:whatsapp_shop/application/search_home/search_home_state.dart';
import 'package:whatsapp_shop/infrastructure/home/home_repository.dart';

class SearchHomeNotifier extends StateNotifier<Future<SearchHomeState>> {
  SearchHomeNotifier() : super(Future.value(SearchHomeState.initial()));

  void emit(SearchHomeEvent event) {
    event.map(search: (searchEvent) async {
      // Loading
      state = Future.value(SearchHomeState.initial().copyWith(isLoading: true));

      // Search Home Api
      final result = await HomeRepository().search(
          shopCategoryId: searchEvent.shopCategoryId,
          keyword: searchEvent.keyword);

      final SearchHomeState searchHomeState = result.fold(
        (l) => SearchHomeState.initial().copyWith(isError: true),
        (r) => SearchHomeState.initial().copyWith(shops: r),
      );

      // Notify UI
      state = Future.value(searchHomeState);
    });
  }
}
