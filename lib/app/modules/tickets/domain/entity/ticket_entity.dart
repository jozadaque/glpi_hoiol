class TicketEntity {
  final int? id;
  final String name;
  final String date;
  final dynamic status;
  final String content;
  final int priority;
  final dynamic itilCategory;

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
