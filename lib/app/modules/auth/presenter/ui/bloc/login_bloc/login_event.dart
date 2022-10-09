import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';

import '../auth_event.dart';

class LoginEvent implements AuthEvent {
  final Params params;

  LoginEvent(this.params);
}

class ReturnInitialPage implements AuthEvent {}
