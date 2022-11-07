import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_products_event.freezed.dart';

@freezed
class SearchProductsEvent with _$SearchProductsEvent {
  //=-=-=-=-=- Search Event -=-=-=-=-=
  const factory SearchProductsEvent.search({
    required int shopId,
    @Default(0) int categoryId,
    required String keyword,
  }) = _SearchProductsEvent;
}
