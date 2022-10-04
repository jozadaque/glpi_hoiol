import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

abstract class AccessEvent {}

class InitialLogoutState implements AccessEvent {}

class LoadingLogoutState implements AccessEvent {}

class SuccessLogoutState implements AccessEvent {}

class ExceptionLogoutState implements AccessEvent {
  final ILoginException exception;

  ExceptionLogoutState(this.exception);
}
