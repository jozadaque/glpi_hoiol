import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/log_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../share/mocks/mocks.dart';

void main() {
  late ILogUserUsecase usecase;
  late MockILogUserRepository repository;
  late MockParams params;
  late MockUnit unit;
  late MockException exception;

  setUp(() {
    repository = MockILogUserRepository();
    usecase = LogUserUsecaseImpl(repository);
    params = MockParams();
    unit = MockUnit();
    exception = MockException();
  });

  group('Success LogUserUsecase:', () {
    test('Should return String when login method is call.', () async {
      when(() => params.user).thenReturn('usuario');
      when(() => params.password).thenReturn('12345');
      when((() => repository.login(params)))
          .thenAnswer((_) async => const Right('anything'));

      final result = await usecase.login(params);

      expect(result.fold((l) => l, (r) => r), isA<String>());
    });

    test('Should return a Unit when logout method is call.', () async {
      when(() => repository.logout('authToken'))
          .thenAnswer((_) async => Right(unit));
      final result = await usecase.logout('authToken');

      expect(result.fold((l) => l, (r) => r), isA<Unit>());
    });
  });

  group('Fail LogUserUsecase:', () {
    test('Should return a Exception when username is empty.', () async {
      when(() => params.user).thenReturn('');
      when(() => params.password).thenReturn('12345');
      when((() => repository.login(params)))
          .thenAnswer((_) async => const Right('anything'));

      final result = await usecase.login(params);

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });

    test('Should return Exception when password is empty.', () async {
      when(() => params.user).thenReturn('username');
      when(() => params.password).thenReturn('');
      when(() => repository.login(params))
          .thenAnswer((_) async => const Right('anythig'));

      final result = await usecase.login(params);

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });

    test('should return an error when the password is less than 4.', () async {
      when(() => params.user).thenReturn('usuario');
      when(() => params.password).thenReturn('123');
      when(() => repository.login(params))
          .thenAnswer((_) async => right('aynthing'));

      final result = await usecase.login(params);

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });

    test('Should return an error when auth_token is empty.', () async {
      when(() => repository.logout('12345'))
          .thenAnswer((_) async => Right(unit));

      final result = await usecase.logout('');

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });

    test('should return an error when the auth_token is incorrect. ', () async {
      when(() => repository.logout('authToken'))
          .thenAnswer((_) async => Left(exception));

      final result = await usecase.logout('authToken');

      expect(result.fold((l) => l, (r) => r), isA<Exception>());
    });
  });
}
