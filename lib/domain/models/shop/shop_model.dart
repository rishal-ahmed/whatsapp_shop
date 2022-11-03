import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
class ShopModel with _$ShopModel {
  const factory ShopModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'slugname') required String slugName,
    @JsonKey(name: 'deliverytime') String? deliveryTime,
    @JsonKey(name: 'logo') String? logo,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'ad_status') String? adStatus,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
}
