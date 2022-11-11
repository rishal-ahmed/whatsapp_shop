import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'customerid') required int customerId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'mobile') required String mobile,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'landmark') required String landmark,
    @JsonKey(name: 'pincode') required String pincode,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'district') required String district,
    @JsonKey(name: 'state') required String state,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'default_address') required String defaultAddress,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
