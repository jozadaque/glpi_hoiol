import 'package:dio/dio.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/repositories/i_log_user_repository.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/log_user_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/datasources/i_log_user_datasource.dart';
import 'package:mocktail/mocktail.dart';

class MockLogUserUsecase extends Mock implements ILogUserUsecase {}

class MockILogUserRepository extends Mock implements IlogUserRepository {}

class MockParams extends Mock implements Params {}

class MockException extends Mock implements Exception {}

class MockLogUserDatasource extends Mock implements ILogUserDatasource {}

class MockDio extends Mock implements Dio {}
