import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/repositories/i_log_user_repository.dart';
import '../types/params.dart';

abstract class ILogUserUsecase {
  Future<Either<Exception, String>> login(Params params);
  Future<Either<Exception, Unit>> logout(String authToken);
}

class LogUserUsecase extends ILogUserUsecase {
  final IlogUserRepository repository;

  LogUserUsecase(this.repository);

  @override
  Future<Either<Exception, String>> login(Params params) async {
    if (params.user.isEmpty) {
      return left(Exception());
    }

    if (params.password.isEmpty) {
      return left(Exception());
    }

    if (params.password.length < 4) {
      return left(Exception());
    }

    final result = await repository.login(params);

    return result;
  }

  @override
  Future<Either<Exception, Unit>> logout(String authToken) async {
    if (authToken.isEmpty) {
      return left(Exception());
    }

    final result = await repository.logout(authToken);
    return result;
  }
}
