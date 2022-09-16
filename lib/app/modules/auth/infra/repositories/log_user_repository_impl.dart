import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/i_log_user_repository.dart';
import '../datasources/i_log_user_datasource.dart';

class LogUserRepositoryImpl implements IlogUserRepository {
  final ILogUserDatasource datasource;

  LogUserRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, String>> login(Params params) async {
    try {
      final result = await datasource.login(params);
      return Right(result);
    } catch (e) {
      return left(Exception());
    }
  }

  @override
  Future<Either<Exception, String>> logout(String authToken) async {
    try {
      final result = await datasource.logout(authToken);

      return right(result);
    } catch (e) {
      return left(Exception());
    }
  }
}
