import 'package:dartz/dartz.dart';
import '../types/params.dart';

abstract class ILogUserUsecase {
  Future<Either<Exception, String>> login(Params params);
  Future<Either<Exception, bool>> logout();
}

class LogUserUsecase extends ILogUserUsecase {
  @override
  Future<Either<Exception, bool>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, String>> login(Params params) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
