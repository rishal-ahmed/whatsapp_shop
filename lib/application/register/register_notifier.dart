import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/register/register_event.dart';
import 'package:whatsapp_shop/application/register/register_state.dart';
import 'package:whatsapp_shop/infrastructure/auth/register_repository.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState.initial());

  void emit(RegisterEvent event) {
    event.map(
      register: (loginEvent) async {
        //Loading
        state = RegisterState.initial().copyWith(isLoading: true);

        // Login Api
        final result = await RegisterRepository().register(
          name: event.name,
          mobile: event.mobile,
          email: event.email,
          password: event.password,
        );

        final RegisterState registerState = result.fold(
          (l) => RegisterState.initial().copyWith(isError: true),
          (r) => RegisterState.initial().copyWith(user: r),
        );

        state = registerState;
      },
    );
  }
}
