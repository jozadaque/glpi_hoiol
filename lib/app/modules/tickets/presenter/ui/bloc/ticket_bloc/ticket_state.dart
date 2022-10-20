import 'package:glpi_hoiol/app/modules/tickets/domain/entity/ticket_entity.dart';

abstract class TicketState {}

class InitialTicketState implements TicketState {}

class LoadingTicketState implements TicketState {}

class SuccessTicketState implements TicketState {
  final List<TicketEntity> tickets;

  SuccessTicketState(this.tickets);
}

class SuccessTicketIDState implements TicketState {
  final TicketEntity ticket;

  SuccessTicketIDState(this.ticket);
}

class ExceptionTicketState implements TicketState {
  final String mensage;
  final StackTrace? stackTrace;

  ExceptionTicketState({
    required this.mensage,
    this.stackTrace,
  });
}
