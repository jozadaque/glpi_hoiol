import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/core/errors/i_failure.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/usecase/ticket_usecase.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/itil_categories.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/ticket_bloc/ticket_event.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/ticket_bloc/ticket_state.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late TicketUsecaseMock ticketUsecase;

  setUp(() {
    ticketUsecase = TicketUsecaseMock();
  });

  group('TicketBlock -Success', () {
    blocTest<TicketBloc, TicketState>(
        'Should return a state of loading and Success to GetTicketEvent  ',
        build: () {
          when(() => ticketUsecase.getTickets())
              .thenAnswer((_) async => right(tickets));
          return TicketBloc(ticketUsecase);
        },
        act: ((bloc) => bloc.add(GetTickets())),
        expect: () => [
              isA<LoadingTicketState>(),
              isA<SuccessTicketState>(),
            ]);

    blocTest<TicketBloc, TicketState>(
        'Should return a state of loading and Success to GetTicketByIdEvent ',
        build: () {
          when(() => ticketUsecase.getTicketById(1))
              .thenAnswer((_) async => right(ticket));
          return TicketBloc(ticketUsecase);
        },
        act: ((bloc) => bloc.add(GetTicketById(1))),
        expect: () => [
              isA<LoadingTicketState>(),
              isA<SuccessTicketIDState>(),
            ]);
  });

  group('TicketBlock - Fail', () {
    blocTest<TicketBloc, TicketState>(
        'Should return a state of loading and Exception to GetTicketEvent  ',
        build: () {
          when(() => ticketUsecase.getTickets())
              .thenAnswer((_) async => left(const IFailure()));
          return TicketBloc(ticketUsecase);
        },
        act: ((bloc) => bloc.add(GetTickets())),
        expect: () => [
              isA<LoadingTicketState>(),
              isA<ExceptionTicketState>(),
            ]);

    blocTest<TicketBloc, TicketState>(
        'Should return a state of loading and Exception to GetTicketByIdEvent ',
        build: () {
          when(() => ticketUsecase.getTicketById(1))
              .thenAnswer((_) async => left(const IFailure()));
          return TicketBloc(ticketUsecase);
        },
        act: ((bloc) => bloc.add(GetTicketById(1))),
        expect: () => [
              isA<LoadingTicketState>(),
              isA<ExceptionTicketState>(),
            ]);
  });
}

class TicketUsecaseMock extends Mock implements TicketUsecase {}

List<Ticket> tickets = List.generate(
    3,
    (i) => Ticket(
        name: '$i',
        date: 'date',
        status: i,
        content: 'content$i',
        priority: i,
        itilCategory: ItilCategories(id: i, name: 'name$i')));

Ticket ticket = Ticket(
    id: 1,
    name: 'name',
    date: 'date',
    status: 1,
    content: 'content',
    priority: 1,
    itilCategory: ItilCategories(id: 1, name: 'name'));
