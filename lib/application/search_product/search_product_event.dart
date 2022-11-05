import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_product_event.freezed.dart';

@freezed
class SearchProductEvent with _$SearchProductEvent {
  //=-=-=-=-=- Search Event -=-=-=-=-=
  const factory SearchProductEvent.search({
    required String shopCategoryId,
    required String keyword,
  }) = _SearchProductEvent;
}
