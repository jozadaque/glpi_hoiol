import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/itil_category_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/repositories/tickets_erros.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/datasources/i_ticket_datasource.dart';
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
    test('Should return a List to TicketEnity', () async {
      when(() => datasource.getTickets()).thenAnswer((_) async => tickets);
      final response = await repository.getTickets();

      expect(response.fold((l) => l, (r) => r), isA<List<TicketEntity>>());
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
      when(() => datasource.getCategoriesById(0))
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

    test('Should return a ListTicketError to getCategories method', () async {
      when(() => datasource.getCategories()).thenThrow(ListCategoryError());

      final response = await repository.getCategories();

      expect(response.fold((l) => l, (r) => r), isA<ListCategoryError>());
    });

    test('Should return a ListTicketError to getTicketsById method', () async {
      when(() => datasource.getTicketById(0)).thenThrow(TicketError());

      final response = await repository.getTicketById(0);

      expect(response.fold((l) => l, (r) => r), isA<TicketError>());
    });

    test('Should return a ListTicketError to getCategoriesById method',
        () async {
      when(() => datasource.getCategoriesById(0)).thenThrow(CategoryError());

      final response = await repository.getCategoriesById(0);

      expect(response.fold((l) => l, (r) => r), isA<CategoryError>());
    });
  });
}

class TicketDatasourceMock extends Mock implements ITicketDatasource {}

List<TicketEntity> tickets = [
  TicketEntity(
    id: 1,
    name: 'name',
    date: 'date',
    status: 1,
    content: 'content',
    priority: 2,
    itilCategory: ItilCategoryEntity(id: 0, name: ''),
  ),
  TicketEntity(
    id: 2,
    name: 'name',
    date: 'date',
    status: 1,
    content: 'content',
    priority: 2,
    itilCategory: ItilCategoryEntity(id: 0, name: ''),
  )
];

List<ItilCategoryEntity> categories = [
  ItilCategoryEntity(id: 1, name: 'name'),
  ItilCategoryEntity(id: 2, name: 'name'),
];
