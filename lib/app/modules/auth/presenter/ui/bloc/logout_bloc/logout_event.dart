abstract class AuthEvent {}

class LogoutEvent implements AuthEvent {
  final String token;

  LogoutEvent(this.token);
}
