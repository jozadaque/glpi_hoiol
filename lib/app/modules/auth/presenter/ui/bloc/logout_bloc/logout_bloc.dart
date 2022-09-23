import 'package:bloc/bloc.dart';
import '../../../../domain/usecases/login_usecase.dart';
import '../../../../exceptions/login_exception.dart';
import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final ILoginUsecase logout;

  LogoutBloc(this.logout) : super(InitialLogoutState()) {
    on(_logout);
  }

  Future<void> _logout(LogoutEvent event, emit) async {
    emit(LoadingLogoutState());

    final result = await logout.logout(event.authToken);

    result.fold(
      (l) => emit(ExceptionLogoutState(l as ILoginException)),
      (r) => emit(SuccessLogoutState()),
    );
  }
}
