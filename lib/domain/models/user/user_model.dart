import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'address') required String? address,
    @JsonKey(name: 'pincode') required String? pincode,
    @JsonKey(name: 'area') required String? area,
    @JsonKey(name: 'district') required String? district,
    @JsonKey(name: 'state') required String? state,
    @JsonKey(name: 'latitude') required String? latitude,
    @JsonKey(name: 'longitude') required String? longitude,
    @JsonKey(name: 'join_on') required String? joinOn,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
