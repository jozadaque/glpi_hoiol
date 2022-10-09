import 'package:bloc/bloc.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

import '../auth_event.dart';
import '../auth_state.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  final ILoginUsecase login;

  LoginBloc(this.login) : super(InitialLoginState()) {
    on(_returnLoginPage);
    on(_login);
  }

  Future<void> _login(LoginEvent event, emit) async {
    emit(LoadingLoginState());

    final result = await login.login(event.params);
    result.fold(
      (l) => emit(ExceptionLoginState(l as IAuthException)),
      (r) => emit(SuccessLoginState(r)),
    );
  }

  Future<void> _returnLoginPage(ReturnInitialPage event, emit) async {
    emit(LoadingLoginState());
    emit(InitialLoginState());
  }
}
