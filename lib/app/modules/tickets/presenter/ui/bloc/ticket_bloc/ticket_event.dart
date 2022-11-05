abstract class TicketEvent {}

class GetTickets implements TicketEvent {}

class GetTicketById implements TicketEvent {
  final int id;

  GetTicketById(this.id);
}
