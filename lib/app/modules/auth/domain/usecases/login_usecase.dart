import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/repositories/i_login_repository.dart';
import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';
import '../types/params.dart';

abstract class ILoginUsecase {
  Future<Either<Exception, String>> login(Params params);
  Future<Either<Exception, String>> logout(String authToken);
}

class LoginUsecaseImpl extends ILoginUsecase {
  final IloginRepository repository;

  LoginUsecaseImpl(this.repository);

  @override
  Future<Either<Exception, String>> login(Params params) async {
    if (params.user.isEmpty) {
      return left(LoginException());
    }

    if (params.password.isEmpty) {
      return left(LoginException());
    }

    final result = await repository.login(params);

    return result;
  }

  @override
  Future<Either<Exception, String>> logout(String authToken) async {
    if (authToken.isEmpty) {
      return left(TokenException());
    }

    final result = await repository.logout(authToken);
    log(result.toString());
    return result;
  }
}
