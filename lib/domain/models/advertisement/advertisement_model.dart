import 'package:freezed_annotation/freezed_annotation.dart';

part 'advertisement_model.freezed.dart';
part 'advertisement_model.g.dart';

@freezed
class AdvertisementModel with _$AdvertisementModel {
  const factory AdvertisementModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'sellerid') int? sellerId,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'url') required String url,
  }) = _AdvertisementModel;

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);
}
