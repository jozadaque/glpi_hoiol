import 'package:bloc/bloc.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<AccessEvent, LoginState> {
  final ILoginUsecase login;

  LoginBloc(this.login) : super(InitialLoginState()) {
    on(_returnLoginPage);
    on(_login);
    on(_logout);
  }

  Future<void> _login(LoginEvent event, emit) async {
    emit(LoadingLoginState());

    final result = await login.login(event.params);
    result.fold(
      (l) => emit(ExceptionLoginState(l as ILoginException)),
      (r) => emit(SuccessLoginState(r)),
    );
  }

  Future<void> _returnLoginPage(ReturnInitialPage event, emit) async {
    emit(LoadingLoginState());
    emit(InitialLoginState());
  }

  Future<void> _logout(LogoutEvent event, emit) async {
    emit(LoadingLoginState());

    final result = await login.logout(event.token);

    result.fold(
      (l) => emit(ExceptionLoginState(l as ILoginException)),
      (r) {
        return emit(InitialLoginState());
      },
    );
  }
}
