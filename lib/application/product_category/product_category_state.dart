import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/product_category/product_category_model.dart';

part 'product_category_state.freezed.dart';

@freezed
class ProductCategoryState with _$ProductCategoryState {
  const factory ProductCategoryState({
    required bool isLoading,
    required bool isError,
    @Default([]) List<ProductCategoryModel> productCategories,
  }) = _ProductCategoryState;

  factory ProductCategoryState.initial() => const ProductCategoryState(
        isLoading: false,
        isError: false,
      );
}
