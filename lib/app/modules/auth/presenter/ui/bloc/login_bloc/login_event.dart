import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';

abstract class AccessEvent {}

class LoginEvent implements AccessEvent {
  final Params params;

  LoginEvent(this.params);
}

class ReturnInitialPage implements AccessEvent {}

class LogoutEvent implements AccessEvent {
  final String token;

  LogoutEvent(this.token);
}
