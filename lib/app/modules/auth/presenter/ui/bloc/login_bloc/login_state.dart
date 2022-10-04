import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

abstract class LoginState {}

class InitialLoginState implements LoginState {}

class LoadingLoginState implements LoginState {}

class SuccessLoginState implements LoginState {
  final String token;

  SuccessLoginState(this.token);
}

class SuccessLogoutState implements LoginState {
  final String token;

  SuccessLogoutState(this.token);
}

class ExceptionLoginState implements LoginState {
  final ILoginException exception;

  ExceptionLoginState(this.exception);
}
