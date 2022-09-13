import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/datasources/i_log_user_datasource.dart';

class LogUserRepositoryImpl implements ILogUserDatasource {
  final ILogUserDatasource datasource;

  LogUserRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, String?>> login(Params params) async {
    final result = await datasource.login(params);
    return result;
  }

  @override
  Future<Either<Exception, Unit>> logout(String authToken) async {
    final result = await datasource.logout(authToken);

    return result;
  }
}
