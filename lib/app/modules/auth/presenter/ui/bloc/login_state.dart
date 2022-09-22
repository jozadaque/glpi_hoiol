abstract class LoginState {}

class InitialLoginState implements LoginState {}

class LoadingLoginState implements LoginState {}

class SuccessLoginState implements LoginState {}

class SuccessLogoutState implements LoginState {}

class ExceptionLoginState implements LoginState {
  final String message;
  final StackTrace? stackTrace;

  ExceptionLoginState({required this.message, this.stackTrace});
}

class ExceptionLogoutState implements LoginState {
  final String message;
  final StackTrace? stackTrace;

  ExceptionLogoutState({required this.message, this.stackTrace});
}
