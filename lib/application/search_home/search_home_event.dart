import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_home_event.freezed.dart';

@freezed
class SearchHomeEvent with _$SearchHomeEvent {
  //=-=-=-=-=- Search Event -=-=-=-=-=
  const factory SearchHomeEvent.search({
    required String shopCategoryId,
    required String keyword,
  }) = _SearchHomeEvent;
}
