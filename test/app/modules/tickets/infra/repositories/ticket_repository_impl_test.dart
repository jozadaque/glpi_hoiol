import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/core/errors/i_failure.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/itil_category_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/errors/tickets_erros.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/datasources/i_ticket_datasource.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/itil_categories.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/repositories/ticket_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late TicketDatasourceMock datasource;
  late TicketRepositoryImpl repository;

  setUp(() {
    datasource = TicketDatasourceMock();
    repository = TicketRepositoryImpl(datasource);
  });

  group('TicketRepository - Success', () {
    test('Should return a List to Ticket', () async {
      when(() => datasource.getTickets()).thenAnswer((_) async => tickets);
      final response = await repository.getTickets();

      expect(response.fold((l) => l, (r) => r), isA<List<Ticket>>());
    });

    test('Should return a List to CategoryEntities', () async {
      when(() => datasource.getCategories())
          .thenAnswer((_) async => categories);
      final response = await repository.getCategories();

      expect(
          response.fold((l) => l, (r) => r), isA<List<ItilCategoryEntity>>());
    });

    test('Should  return a TicketEntity  object', () async {
      when(() => datasource.getTicketById(0))
          .thenAnswer((_) async => tickets[0]);
      final response = await repository.getTicketById(0);
      expect(response.fold((l) => l, (r) => r), isA<TicketEntity>());
    });

    test('Should return a ItilCategority object', () async {
      when(() => datasource.getCategoryById(0))
          .thenAnswer((_) async => categories[0]);
      final response = await repository.getCategoriesById(0);

      expect(response.fold((l) => l, (r) => r), isA<ItilCategoryEntity>());
    });
  });

  group('TicketRepositoryImpl - Fail', () {
    test('Should return a ListTicketError to getTickets method', () async {
      when(() => datasource.getTickets()).thenThrow(ListTicketError());

      final response = await repository.getTickets();

      expect(response.fold((l) => l, (r) => r), isA<ListTicketError>());
    });

    test('Should return a ListCategoryError to getCategories method', () async {
      when(() => datasource.getCategories()).thenThrow(const IFailure());

      final response = await repository.getCategories();

      expect(response.fold((l) => l, (r) => r), isA<ListCategoryError>());
    });

    test('Should return a TicketError to getTicketsById method', () async {
      when(() => datasource.getTicketById(0)).thenThrow(const IFailure());

      final response = await repository.getTicketById(0);

      expect(response.fold((l) => l, (r) => r), isA<TicketError>());
    });

    test('Should return a CategoryError to getCategoriesById method', () async {
      when(() => datasource.getCategoryById(0)).thenThrow(const IFailure());

      final response = await repository.getCategoriesById(0);

      expect(response.fold((l) => l, (r) => r), isA<CategoryError>());
    });
  });
}

class TicketDatasourceMock extends Mock implements ITicketDatasource {}

List<Ticket> tickets = [
  Ticket(
    id: 1,
    name: 'name',
    date: 'date',
    status: 1,
    content: 'content',
    priority: 2,
    itilCategory: 1,
  ),
  Ticket(
    id: 2,
    name: 'name',
    date: 'date',
    status: 1,
    content: 'content',
    priority: 2,
    itilCategory: 2,
  )
];

List<ItilCategories> categories = [
  ItilCategories(id: 1, name: 'name'),
  ItilCategories(id: 2, name: 'name'),
];
