import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  //=-=-=-=-=- Login Event -=-=-=-=-=
  const factory RegisterEvent.register({
    required String name,
    required String mobile,
    required String email,
    required String password,
  }) = _RegisterEvent;
}
