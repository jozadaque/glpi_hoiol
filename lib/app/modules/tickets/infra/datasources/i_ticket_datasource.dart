import '../../domain/entity/itil_category_entity.dart';
import '../../domain/entity/ticket_entity.dart';

abstract class ITicketDatasource {
  Future<List<TicketEntity>> getTickets();
  Future<TicketEntity> getTicketById(int id);
  Future<List<ItilCategoryEntity>> getCategories();
  Future<ItilCategoryEntity> getCategoriesById(int id);
}
