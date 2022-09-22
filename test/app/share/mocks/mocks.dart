import 'package:dio/native_imp.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/repositories/i_login_repository.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/datasources/i_login_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockLogUserUsecase extends Mock implements ILoginUsecase {}

class MockILogUserRepository extends Mock implements IloginRepository {}

class MockParams extends Mock implements Params {}

class MockException extends Mock implements Exception {}

class MockLogUserDatasource extends Mock implements ILoginDatasource {}

class MockDio extends Mock implements DioForNative {}
