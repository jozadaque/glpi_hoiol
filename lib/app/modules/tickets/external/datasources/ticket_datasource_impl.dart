import 'package:dio/dio.dart';
import 'package:glpi_hoiol/app/core/constants/constants.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/datasources/i_ticket_datasource.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/itil_categories.dart';

class TicketDatasourceImpl implements ITicketDatasource {
  final Dio dio;

  TicketDatasourceImpl(this.dio);

  @override
  Future<List<ItilCategories>> getCategories() async {
    final response = await dio.get('$appUrl/ITILCategory',
        options: Options(headers: {'Session-Token': authToken}));

    final list = response.data as List;

    final categories = list
        .map((jsom) => ItilCategories(id: jsom['id'], name: jsom['name']))
        .toList();

    return categories;
  }

  @override
  Future<ItilCategories> getCategoriesById(int id) {
    // TODO: implement getCategoriesById
    throw UnimplementedError();
  }

  @override
  Future<Ticket> getTicketById(int id) {
    // TODO: implement getTicketById
    throw UnimplementedError();
  }

  @override
  Future<List<Ticket>> getTickets() {
    // TODO: implement getTickets
    throw UnimplementedError();
  }
}
