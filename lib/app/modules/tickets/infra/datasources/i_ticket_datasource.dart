import '../entity/itil_categories.dart';
import '../entity/ticket_entity.dart';

abstract class ITicketDatasource {
  Future<List<Ticket>> getTickets();
  Future<Ticket> getTicketById(int id);
  Future<List<ItilCategories>> getCategories();
  Future<ItilCategories> getCategoryById(int id);
}
