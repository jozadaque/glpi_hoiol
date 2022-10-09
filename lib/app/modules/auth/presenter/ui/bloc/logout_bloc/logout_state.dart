import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/auth_state.dart';

class InitialLogoutState implements AuthState {}

class LoadingLogoutState implements AuthState {}

class SuccessLogoutState implements AuthState {}

class ExceptionLogoutState implements AuthState {
  final IAuthException exception;

  ExceptionLogoutState(this.exception);
}
