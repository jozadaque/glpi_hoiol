import 'package:bloc/bloc.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/usecase/ticket_usecase.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/ticket_bloc/ticket_event.dart';

import 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketUsecase tickets;

  TicketBloc(this.tickets) : super(InitialTicketState()) {
    on(_getTickets);
    on(_getTicketsById);
  }

  Future<void> _getTickets(GetTickets event, emit) async {
    emit(LoadingTicketState());

    final result = await tickets.getTickets();

    result.fold(
      (l) => emit(ExceptionTicketState(mensage: l.toString())),
      (r) => emit(SuccessTicketState(r)),
    );
  }

  Future<void> _getTicketsById(GetTicketById event, emit) async {
    emit(LoadingTicketState());

    final result = await tickets.getTicketById(event.id);

    result.fold(
      (l) => emit(ExceptionTicketState(mensage: l.toString())),
      (r) => emit(SuccessTicketIDState(r)),
    );
  }
}
