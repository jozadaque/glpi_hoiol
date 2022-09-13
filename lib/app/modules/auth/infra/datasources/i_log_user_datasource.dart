import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';

abstract class ILogUserDatasource {
  Future<Either<Exception, String?>> login(Params params);

  Future<Either<Exception, Unit>> logout(String authToken);
}
