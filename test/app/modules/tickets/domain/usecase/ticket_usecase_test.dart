import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/itil_category_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/errors/tickets_erros.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/repositories/i_ticket_repository.dart';

import 'package:glpi_hoiol/app/modules/tickets/domain/usecase/ticket_usecase.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late MockTicketRepository repository;
  late TicketUsecase usecase;

  setUp(() {
    repository = MockTicketRepository();
    usecase = TicketUsecase(repository);
  });

  group('TicketUsecase - Success', () {
    test('Shoul return a list TicketModels', () async {
      when(() => repository.getTickets())
          .thenAnswer((_) async => right(tickets));

      final response = await usecase.getTickets();

      expect(response.fold((l) => l, (r) => r), isA<List<TicketEntity>>());
    });

    test('Shoul return a  TicketModel object', () async {
      when(() => repository.getTicketById(0))
          .thenAnswer((_) async => right(tickets[0]));

      final response = await usecase.getTicketById(0);

      expect(response.fold((l) => l, (r) => r), isA<TicketEntity>());
    });

    test('Shoul return a list ItilCategoryEntity', () async {
      when(() => repository.getCategories())
          .thenAnswer((_) async => right(categories));

      final response = await usecase.getCategories();

      expect(
          response.fold((l) => l, (r) => r), isA<List<ItilCategoryEntity>>());
    });

    test('Shoul return a  ItilCategoryEntity object', () async {
      when(() => repository.getCategoriesById(0))
          .thenAnswer((_) async => right(categories[0]));

      final response = await usecase.getCategoriesById(0);

      expect(response.fold((l) => l, (r) => r), isA<ItilCategoryEntity>());
    });
  });

  group('TicketUsecase -  Fail', () {
    test('Should get a FailException to getTicketById method', () async {
      when(() => repository.getTicketById(0))
          .thenAnswer((_) async => left(TicketError()));

      final response = await usecase.getTicketById(0);

      expect(response.fold((l) => l, (r) => r), isA<TicketError>());
    });

    test('Should get a FailException to getTicket method', () async {
      when(() => repository.getTickets())
          .thenAnswer((_) async => left(ListTicketError()));

      final response = await usecase.getTickets();

      expect(response.fold((l) => l, (r) => r), isA<ListTicketError>());
    });

    test('Should get a FailException to getTicketById method', () async {
      when(() => repository.getCategoriesById(0))
          .thenAnswer((_) async => left(CategoryError()));

      final response = await usecase.getCategoriesById(0);

      expect(response.fold((l) => l, (r) => r), isA<CategoryError>());
    });

    test('Should get a FailException to getCategories method', () async {
      when(() => repository.getCategories())
          .thenAnswer((_) async => left(ListCategoryError()));

      final response = await usecase.getCategories();

      expect(response.fold((l) => l, (r) => r), isA<ListCategoryError>());
    });
  });
}

class MockTicketRepository extends Mock implements ITicketRepository {}

List<TicketEntity> tickets = [
  TicketEntity(
    id: 1,
    name: 'name',
    date: 'date',
    status: 1,
    content: 'content',
    priority: 2,
    itilCategory: 1,
  ),
  TicketEntity(
    id: 2,
    name: 'name',
    date: 'date',
    status: 1,
    content: 'content',
    priority: 2,
    itilCategory: 1,
  )
];

List<ItilCategoryEntity> categories = [
  ItilCategoryEntity(id: 1, name: 'name'),
  ItilCategoryEntity(id: 2, name: 'name'),
];
