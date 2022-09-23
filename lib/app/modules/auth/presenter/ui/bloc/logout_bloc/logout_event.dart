abstract class UnAccessEvent {}

class LogoutEvent implements UnAccessEvent {
  final String authToken;

  LogoutEvent(this.authToken);
}
