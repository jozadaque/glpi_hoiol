import '../auth_event.dart';

class LogoutEvent implements AuthEvent {
  final String token;

  LogoutEvent(this.token);
}
