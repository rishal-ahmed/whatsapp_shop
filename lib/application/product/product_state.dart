import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/product/product_model.dart';
import 'package:whatsapp_shop/domain/models/unit/unit_model.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    required bool isLoading,
    required bool isError,
    @Default(null) ProductModel? product,
    @Default([]) List<UnitModel> units,
    @Default(null) String? category,
    @Default(null) String? seller,
    @Default([]) List<ProductModel> similarProducts,
  }) = _ProductState;

  factory ProductState.initial() =>
      const ProductState(isLoading: false, isError: false);
}
