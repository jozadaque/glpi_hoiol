abstract class LogUserException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  LogUserException({
    required this.message,
    this.stackTrace,
  });
}

class LoginException extends LogUserException {
  LoginException(
      {String message = 'Erro no campo Login', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class PasswordException extends LogUserException {
  PasswordException(
      {String message = 'Erro no campo Senha', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class TokenException extends LogUserException {
  TokenException({String message = 'Token invalido', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}
