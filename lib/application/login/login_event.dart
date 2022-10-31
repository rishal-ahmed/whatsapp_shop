import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  //=-=-=-=-=- Login Event -=-=-=-=-=
  const factory LoginEvent.login(
      {required String username, required String password}) = _LoginEvent;
}
