import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

import '../auth_state.dart';

class InitialLoginState implements AuthState {}

class LoadingLoginState implements AuthState {}

class SuccessLoginState implements AuthState {
  final String token;

  SuccessLoginState(this.token);
}

class ExceptionLoginState implements AuthState {
  final IAuthException exception;

  ExceptionLoginState(this.exception);
}
