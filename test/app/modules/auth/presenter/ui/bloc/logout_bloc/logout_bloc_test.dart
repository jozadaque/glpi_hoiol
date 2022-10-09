import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/auth_state.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/logout_bloc/logout_bloc.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/logout_bloc/logout_event.dart';
import 'package:glpi_hoiol/app/modules/auth/presenter/ui/bloc/logout_bloc/logout_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../share/mocks/mocks.dart';

void main() {
  late ILoginUsecase logout;
  late MockParams params;

  setUp(() {
    params = MockParams();
    logout = MockLoginUsecase();
  });

  group('Sucess LoginBloc', () {
    blocTest<LogoutBloc, AuthState>(
        'should return a state of loading and Success',
        build: () {
          when(() => logout.logout('anything'))
              .thenAnswer((_) async => right('anything'));
          return LogoutBloc(logout);
        },
        act: (bloc) => bloc.add(LogoutEvent('anything')),
        expect: () => [
              isA<LoadingLogoutState>(),
              isA<SuccessLogoutState>(),
            ]);
  });

  group('Fail LoginBloc', () {
    blocTest<LogoutBloc, AuthState>(
        'should return a state of loading and Exception',
        build: () {
          when(() => logout.logout('anything'))
              .thenAnswer((_) async => left(LogoutException()));
          return LogoutBloc(logout);
        },
        act: (bloc) => bloc.add(LogoutEvent('anything')),
        expect: () => [
              isA<LoadingLogoutState>(),
              isA<ExceptionLogoutState>(),
            ]);
  });
}
