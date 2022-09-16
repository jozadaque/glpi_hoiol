import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/auth/infra/repositories/log_user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../share/mocks/mocks.dart';

void main() {
  late MockParams params;
  late MockLogUserDatasource datasource;
  late LogUserRepositoryImpl repository;

  setUp(() {
    params = MockParams();
    datasource = MockLogUserDatasource();
    repository = LogUserRepositoryImpl(datasource);
  });

  group('Success LogUserRepositoryImpl:', () {
    test('Should return a String when the login method is call.', () async {
      when(() => datasource.login(params)).thenAnswer((_) async => 'anything');

      final result = await repository.login(params);

      expect(result.fold((l) => l, (r) => r), isA<String>());
    });

    test('Should return String when the logout method is call.', () async {
      when(() => datasource.logout('anything')).thenAnswer((_) async => '200');

      final result = await repository.logout('anything');

      expect(result.fold((l) => l, (r) => r), isA<String>());
    });
  });

  group('Fail LogUserRepositoryImpl:', () {
    test('Should return a Exception to when login return a Left ', () async {
      when(() => datasource.login(params)).thenThrow('throwable');

      final result = await repository.login(params);

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });

    test('Should return a Exception when logout return a Left ', () async {
      when(() => datasource.logout('anything')).thenThrow('400');

      final result = await repository.logout('anything');

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });
  });
}
