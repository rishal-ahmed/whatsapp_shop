import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/shop/shop_model.dart';

part 'search_product_state.freezed.dart';

@freezed
class SearchProductState with _$SearchProductState {
  const factory SearchProductState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<ShopModel> shops,
  }) = _SearchProductState;
  const SearchProductState._();

  factory SearchProductState.initial() =>
      const SearchProductState(isLoading: false, isError: false);
}
