import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glpi_hoiol/app/core/errors/i_failure.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/itil_category_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/usecase/ticket_usecase.dart';
import 'package:glpi_hoiol/app/modules/tickets/infra/entity/itil_categories.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/category_bloc/category_bloc.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/category_bloc/category_event.dart';
import 'package:glpi_hoiol/app/modules/tickets/presenter/ui/bloc/category_bloc/category_state.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late TicketUsecaseMock ticketUsecase;

  setUp(() {
    ticketUsecase = TicketUsecaseMock();
  });

  group('CategoryBlock -Success', () {
    blocTest<CategoryBloc, CategoryState>(
        'Should return a state of loading and Success to GetCategory Event  ',
        build: () {
          when(() => ticketUsecase.getCategories())
              .thenAnswer((_) async => right(categories));
          return CategoryBloc(ticketUsecase);
        },
        act: ((bloc) => bloc.add(GetCategories())),
        expect: () => [
              isA<LoadingCategoryState>(),
              isA<SuccessCategoryState>(),
            ]);

    blocTest<CategoryBloc, CategoryState>(
      'Should return a state of loading and Success to GetCategoryById Event ',
      build: () {
        when(() => ticketUsecase.getCategoriesById(1))
            .thenAnswer((_) async => right(category));
        return CategoryBloc(ticketUsecase);
      },
      act: ((bloc) => bloc.add(GetCategoryById(1))),
      expect: () => [
        isA<LoadingCategoryState>(),
        isA<SuccessCategoryIDState>(),
      ],
    );
  });

  group('CategoryBlock -Fail', () {
    blocTest<CategoryBloc, CategoryState>(
        'Should return a state of loading and Exception to GetCategory Event  ',
        build: () {
          when(() => ticketUsecase.getCategories())
              .thenAnswer((_) async => left(const IFailure()));
          return CategoryBloc(ticketUsecase);
        },
        act: ((bloc) => bloc.add(GetCategories())),
        expect: () => [
              isA<LoadingCategoryState>(),
              isA<ExceptionCategoryState>(),
            ]);

    blocTest<CategoryBloc, CategoryState>(
      'Should return a state of loading and Exception to GetCategoryById Event ',
      build: () {
        when(() => ticketUsecase.getCategoriesById(1))
            .thenAnswer((_) async => left(const IFailure()));
        return CategoryBloc(ticketUsecase);
      },
      act: ((bloc) => bloc.add(GetCategoryById(1))),
      expect: () => [
        isA<LoadingCategoryState>(),
        isA<ExceptionCategoryState>(),
      ],
    );
  });
}

class TicketUsecaseMock extends Mock implements TicketUsecase {}

List<ItilCategories> categories =
    List.generate(3, (i) => ItilCategories(id: i, name: 'name$i'));

ItilCategoryEntity category = ItilCategories(id: 1, name: 'name');
