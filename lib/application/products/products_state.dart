import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<ProductModel> products,
  }) = _ProductsState;

  factory ProductsState.initial() =>
      const ProductsState(isLoading: false, isError: false);
}
