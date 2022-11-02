import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/user/user_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool isLoading,
    required bool isError,
    UserModel? user,
  }) = _LoginState;
  const LoginState._();

  factory LoginState.initial() => LoginState(isLoading: false, isError: false);
}
