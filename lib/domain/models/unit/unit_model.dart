import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
class UnitModel with _$UnitModel {
  const factory UnitModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'productid') required int productId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'offerprice') required double offerPrice,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'disp_order') required int displayOrder,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);
}
