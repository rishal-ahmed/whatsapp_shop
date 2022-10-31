import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsapp_shop/domain/models/user_model.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    required bool isLoading,
    required bool isError,
    UserModel? user,
  }) = _RegisterState;
  const RegisterState._();

  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        isError: false,
      );
}
