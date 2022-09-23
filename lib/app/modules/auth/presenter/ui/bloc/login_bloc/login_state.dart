import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

abstract class LoginState {}

class InitialLoginState implements LoginState {}

class LoadingLoginState implements LoginState {}

class SuccessLoginState implements LoginState {}

class ExceptionLoginState implements LoginState {
  final ILoginException exception;

  ExceptionLoginState(this.exception);
}
