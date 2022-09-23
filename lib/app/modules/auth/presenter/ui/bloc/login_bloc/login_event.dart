import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';

abstract class AccessEvent {}

class LoginEvent implements AccessEvent {
  final Params params;

  LoginEvent(this.params);
}
