abstract class IAuthException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  IAuthException({
    required this.message,
    this.stackTrace,
  });
}

class LoginException extends IAuthException {
  LoginException(
      {String message = 'Erro no campo Login', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class PasswordException extends IAuthException {
  PasswordException(
      {String message = 'Erro no campo Senha', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class TokenException extends IAuthException {
  TokenException({String message = 'Token invalido', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class LogoutException extends IAuthException {
  LogoutException(
      {String message = 'Não foi Possível realizar Logout',
      StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}
