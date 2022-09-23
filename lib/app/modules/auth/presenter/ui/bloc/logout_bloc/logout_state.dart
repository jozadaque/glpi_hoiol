import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

abstract class LogoutState {}

class InitialLogoutState implements LogoutState {}

class LoadingLogoutState implements LogoutState {}

class SuccessLogoutState implements LogoutState {}

class ExceptionLogoutState implements LogoutState {
  final ILoginException exception;

  ExceptionLogoutState(this.exception);
}
