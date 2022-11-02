import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_category_model.freezed.dart';
part 'shop_category_model.g.dart';

@freezed
class ShopCategoryModel with _$ShopCategoryModel {
  const factory ShopCategoryModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _ShopCategoryModel;

  factory ShopCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ShopCategoryModelFromJson(json);
}
