import 'itil_category_entity.dart';

class TicketEntity {
  final int? id;
  final String name;
  final String date;
  final int status;
  final String content;
  final int priority;
  final ItilCategoryEntity itilCategory;

  TicketEntity({
    this.id,
    required this.name,
    required this.date,
    required this.status,
    required this.content,
    required this.priority,
    required this.itilCategory,
  });
}
