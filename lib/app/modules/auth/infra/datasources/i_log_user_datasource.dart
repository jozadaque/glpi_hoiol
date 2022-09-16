import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';

abstract class ILogUserDatasource {
  Future<String> login(Params params);

  Future<String> logout(String authToken);
}
