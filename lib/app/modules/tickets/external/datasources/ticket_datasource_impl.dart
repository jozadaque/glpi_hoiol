import 'package:dio/dio.dart';
import 'package:glpi_hoiol/app/core/constants/constants.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/errors/tickets_erros.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/datasources/i_ticket_datasource.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/itil_categories.dart';

class TicketDatasourceImpl implements ITicketDatasource {
  final Dio dio;

  TicketDatasourceImpl(this.dio);

  @override
  Future<List<Ticket>> getTickets() async {
    try {
      final response = await dio.get('$appUrl/Ticket',
          options: Options(headers: {'Session-Token': authToken}));
      final list = response.data as List;
      final tickets = list
          .map((data) => Ticket(
              id: data['id'],
              name: data['name'],
              date: data['date'],
              status: data['status'],
              content: data['content'],
              priority: data['priority'],
              itilCategory: _getNameCategory(data['itilcategories_id'])))
          .toList();

      return tickets;
    } on DioError catch (e, s) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          throw ErrorNotAuth(stackTrace: s);
        }
      }
      throw NotFoundedError(stackTrace: s);
    }
  }

  @override
  Future<List<ItilCategories>> getCategories() async {
    try {
      final response = await dio.get('$appUrl/ITILCategory',
          options: Options(headers: {'Session-Token': authToken}));

      final list = response.data as List;
      final categories = list.map(ItilCategories.fromJson).toList();
      return categories;
    } on DioError catch (e, s) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          throw ErrorNotAuth(stackTrace: s);
        }
      }
      throw NotFoundedError(stackTrace: s);
    }
  }

  @override
  Future<Ticket> getTicketById(int id) async {
    try {
      final response = await dio.get('$appUrl/Ticket/$id',
          options: Options(headers: {'Session-Token': authToken}));
      final data = response.data;

      final Ticket ticket = Ticket(
          id: data['id'],
          name: data['name'],
          date: data['date'],
          status: data['status'],
          content: data['content'],
          priority: data['priority'],
          itilCategory: await getCategoryById(data['itilcategories_id']));

      return ticket;
    } on DioError catch (e, s) {
      //print(e.response);
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          throw ErrorNotAuth(stackTrace: s);
        } else if (e.response!.statusCode == 404) {
          throw TicketError(stackTrace: s);
        }
      }
      throw NotFoundedError(stackTrace: s);
    }
  }

  @override
  Future<ItilCategories> getCategoryById(int id) async {
    try {
      final response = await dio.get('$appUrl/ITILCategory/$id',
          options: Options(headers: {'Session-Token': authToken}));
      final data = response.data;
      return ItilCategories(id: data['id'], name: data['name']);
    } on DioError catch (e, s) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          throw ErrorNotAuth(stackTrace: s);
        } else if (e.response!.statusCode == 404) {
          throw CategoryError(stackTrace: s);
        }
      }
      throw NotFoundedError(stackTrace: s);
    }
  }

  _getNameCategory(int id) async {
    final ItilCategories category = await getCategoryById(id);
    return category.name;
  }
}
