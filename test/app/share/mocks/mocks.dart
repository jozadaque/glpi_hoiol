import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/repositories/i_log_user_repository.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/types/params.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/log_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockLogUserUsecase extends Mock implements ILogUserUsecase {}

class MockILogUserRepository extends Mock implements IlogUserRepository {}

class MockParams extends Mock implements Params {}

class MockUnit extends Mock implements Unit {}

class MockException extends Mock implements Exception {}
