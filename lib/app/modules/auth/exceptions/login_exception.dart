abstract class ILoginException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  ILoginException({
    required this.message,
    this.stackTrace,
  });
}

class LoginException extends ILoginException {
  LoginException(
      {String message = 'Erro no campo Login', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class PasswordException extends ILoginException {
  PasswordException(
      {String message = 'Erro no campo Senha', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class TokenException extends ILoginException {
  TokenException({String message = 'Token invalido', StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}
