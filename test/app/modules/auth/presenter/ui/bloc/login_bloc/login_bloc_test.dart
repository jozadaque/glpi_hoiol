import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/login_bloc/login_bloc.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/login_bloc/login_event.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/login_bloc/login_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../share/mocks/mocks.dart';

void main() {
  late ILoginUsecase login;
  late MockParams params;

  setUp(() {
    params = MockParams();
    login = MockLoginUsecase();
  });

  group('Sucess LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
        'should return a state of loading and Success',
        build: () {
          when(() => login.login(params))
              .thenAnswer((_) async => right('anything'));
          return LoginBloc(login);
        },
        act: (bloc) => bloc.add(LoginEvent(params)),
        expect: () => [
              isA<LoadingLoginState>(),
              isA<SuccessLoginState>(),
            ]);
  });

  group('Fail LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
        'should return a state of loading and Exception',
        build: () {
          when(() => login.login(params))
              .thenAnswer((_) async => left(LoginException()));
          return LoginBloc(login);
        },
        act: (bloc) => bloc.add(LoginEvent(params)),
        expect: () => [
              isA<LoadingLoginState>(),
              isA<ExceptionLoginState>(),
            ]);
  });
}
