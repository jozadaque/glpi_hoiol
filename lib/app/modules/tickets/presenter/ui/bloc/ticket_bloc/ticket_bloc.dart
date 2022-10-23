import 'package:bloc/bloc.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/errors/tickets_erros.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/usecase/ticket_usecase.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/ticket_bloc/ticket_event.dart';

import '../../../../../../core/errors/i_failure.dart';
import 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketUsecase tickets;

  TicketBloc(this.tickets) : super(InitialTicketState()) {
    on(_getTickets);
    on(_getTicketsById);
  }

  Future<void> _getTickets(GetTickets event, emit) async {
    emit(LoadingTicketState());
    try {
      final result = await tickets.getTickets();
      result.fold(
        (l) => emit(ExceptionTicketState(l)),
        (r) => emit(SuccessTicketState(r)),
      );
    } on IFailure catch (e) {
      emit(ExceptionTicketState(NotFoundedError(message: e.message)));
    }
  }

  Future<void> _getTicketsById(GetTicketById event, emit) async {
    emit(LoadingTicketState());

    try {
      final result = await tickets.getTicketById(event.id);

      result.fold(
        (l) => emit(ExceptionTicketState(l)),
        (r) => emit(SuccessTicketIDState(r)),
      );
    } on IFailure catch (e) {
      emit(ExceptionTicketState(NotFoundedError(message: e.message)));
    }
  }
}
