import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_shop/application/login/login_event.dart';
import 'package:whatsapp_shop/application/login/login_state.dart';
import 'package:whatsapp_shop/infrastructure/auth/login_repository.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState.initial());

  void emit(LoginEvent event) {
    event.map(
      login: (loginEvent) async {
        //Loading
        state = LoginState.initial().copyWith(isLoading: true);

        // Login Api
        final result = await LoginRepository()
            .login(username: event.username, password: event.password);

        final LoginState loginState = result.fold(
          //=-=-=-=- Failure -=-=-=-=-=
          (failure) {
            return failure.when(
              clientFailure: (error) {
                return LoginState.initial().copyWith(
                  isError: true,
                  errorMessage: error,
                );
              },
              serverFailure: (error) {
                return LoginState.initial().copyWith(
                  isError: true,
                  errorMessage: error,
                );
              },
            );
          },
          //=-=-=-=- Success -=-=-=-=-=
          (success) => LoginState.initial().copyWith(user: success),
        );

        state = loginState;
      },
    );
  }
}
