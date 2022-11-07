import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';

part 'search_products_state.freezed.dart';

@freezed
class SearchProductsState with _$SearchProductsState {
  const factory SearchProductsState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<ProductModel> products,
  }) = _SearchProductsState;
  const SearchProductsState._();

  factory SearchProductsState.initial() =>
      const SearchProductsState(isLoading: false, isError: false);
}
