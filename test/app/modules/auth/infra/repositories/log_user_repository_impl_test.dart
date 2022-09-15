import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/repositories/log_user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../share/mocks/mocks.dart';

void main() {
  late MockParams params;
  late MockLogUserDatasource datasource;
  late MockUnit unit;
  late MockException exception;
  late LogUserRepositoryImpl repository;

  setUp(() {
    params = MockParams();
    datasource = MockLogUserDatasource();
    unit = MockUnit();
    exception = MockException();
    repository = LogUserRepositoryImpl(datasource);
  });

  group('Success LogUserRepositoryImpl:', () {
    test('Should return a String when the login method is call.', () async {
      when(() => params.user).thenReturn('username');
      when(() => params.password).thenReturn('password');
      when(() => datasource.login(params))
          .thenAnswer((_) async => const Right('anything'));

      final result = await repository.login(params);

      expect(result.fold((l) => l, (r) => r), isA<String>());
    });

    test('Should return Unit when the logout method is call.', () async {
      when(() => datasource.logout('anything'))
          .thenAnswer((_) async => Right(unit));

      final result = await repository.logout('anything');

      expect(result.fold((l) => l, (r) => r), isA<Unit>());
    });
  });

  group('Fail LogUserRepositoryImpl:', () {
    test('Should return a Exception to when login return a Left ', () async {
      when(() => datasource.login(params))
          .thenAnswer((_) async => Left(exception));
      final result = await datasource.login(params);

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });

    test('Should return a Exception when logout return a Left ', () async {
      when(() => datasource.logout('anything'))
          .thenAnswer((_) async => Left(exception));
      final result = await datasource.logout('anything');

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });
  });
}
