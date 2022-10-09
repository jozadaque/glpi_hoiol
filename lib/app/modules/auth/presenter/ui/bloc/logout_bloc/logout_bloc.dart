import 'package:bloc/bloc.dart';
import 'package:glpi_hoiol/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:glpi_hoiol/app/modules/auth/exceptions/login_exception.dart';

import '../auth_state.dart';

import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<AuthEvent, AuthState> {
  final ILoginUsecase logout;

  LogoutBloc(this.logout) : super(LoadingLogoutState()) {
    on(_logout);
  }

  Future<void> _logout(LogoutEvent event, emit) async {
    emit(LoadingLogoutState());

    final result = await logout.logout(event.token);

    result.fold(
      (l) => emit(ExceptionLogoutState(l as IAuthException)),
      (r) {
        return emit(SuccessLogoutState());
      },
    );
  }
}
