import '../../domain/entity/ticket_entity.dart';

class Ticket implements TicketEntity {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String date;
  @override
  final dynamic status;
  @override
  final String content;
  @override
  final int priority;
  @override
  final dynamic itilCategory;

  Ticket({
    this.id,
    required this.name,
    required this.date,
    required this.status,
    required this.content,
    required this.priority,
    required this.itilCategory,
  });
}
