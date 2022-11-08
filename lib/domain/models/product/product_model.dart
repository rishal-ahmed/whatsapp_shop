import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/unit/unit_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'shopid') required int shopId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'desc') required String description,
    @JsonKey(name: 'categoryid') required int categoryId,
    @JsonKey(name: 'categoryname') required String categoryName,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'image2') String? image2,
    @JsonKey(name: 'image3') String? image3,
    @JsonKey(name: 'image4') String? image4,
    @JsonKey(name: 'featured') required String featured,
    @JsonKey(name: 'popular') required String popular,
    @JsonKey(name: 'trending') required String trending,
    @JsonKey(name: 'unit') @Default(null) UnitModel? unit,
    @JsonKey(name: 'units') @Default([]) List<UnitModel> units,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
