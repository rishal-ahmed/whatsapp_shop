import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category_model.freezed.dart';

@freezed
class ProductCategoryModel with _$ProductCategoryModel {
  const factory ProductCategoryModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'shopid') required int shopId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'disporder') required int displayOrder,
    @JsonKey(name: 'image') required String image,
  }) = _ProductCategoryModel;
}
