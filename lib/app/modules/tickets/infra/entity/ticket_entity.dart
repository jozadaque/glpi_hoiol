import '../../domain/entity/itil_category_entity.dart';
import '../../domain/entity/ticket_entity.dart';

class Ticket implements TicketEntity {
  @override
  final int? id;
  @override
  final String name;
  @override
  final String date;
  @override
  final int status;
  @override
  final String content;
  @override
  final int priority;
  @override
  final ItilCategoryEntity itilCategory;

  Ticket({
    this.id,
    required this.name,
    required this.date,
    required this.status,
    required this.content,
    required this.priority,
    required this.itilCategory,
  });

  factory Ticket.fromJom(dynamic jsom) {
    return Ticket(
        name: jsom['name'],
        date: jsom['date'],
        status: jsom['status'],
        content: jsom['content'],
        priority: jsom['priority'],
        itilCategory: jsom['itilCategory']);
  }
}
