import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/i_login_repository.dart';
import '../datasources/i_login_datasource.dart';

class LoginRepositoryImpl implements IloginRepository {
  final ILoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

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
