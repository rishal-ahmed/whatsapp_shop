import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/shop/shop_model.dart';

part 'search_home_state.freezed.dart';

@freezed
class SearchHomeState with _$SearchHomeState {
  const factory SearchHomeState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<ShopModel> shops,
  }) = _SearchHomeState;
  const SearchHomeState._();

  factory SearchHomeState.initial() =>
      const SearchHomeState(isLoading: false, isError: false);
}
