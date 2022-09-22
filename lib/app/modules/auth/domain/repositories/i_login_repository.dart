import 'package:dartz/dartz.dart';

import '../types/params.dart';

abstract class IloginRepository {
  Future<Either<Exception, String>> login(Params params);
  Future<Either<Exception, String>> logout(String authToken);
}
