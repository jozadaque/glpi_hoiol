import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/repositories/i_ticket_repository.dart';

import '../../../../core/errors/i_failure.dart';
import '../entity/itil_category_entity.dart';

abstract class ITicketUsecase {
  Future<Either<IFailure, List<TicketEntity>>> getTickets();
  Future<Either<IFailure, TicketEntity>> getTicketById(int id);
  Future<Either<IFailure, List<ItilCategoryEntity>>> getCategories();
  Future<Either<IFailure, ItilCategoryEntity>> getCategoriesById(int id);
}

class TicketUsecase implements ITicketUsecase {
  final ITicketRepository _repository;

  TicketUsecase(this._repository);
  @override
  Future<Either<IFailure, TicketEntity>> getTicketById(int id) async {
    final response = await _repository.getTicketById(id);
    return response;
  }

  @override
  Future<Either<IFailure, List<TicketEntity>>> getTickets() async {
    final response = await _repository.getTickets();

    return response;
  }

  @override
  Future<Either<IFailure, List<ItilCategoryEntity>>> getCategories() async {
    final response = await _repository.getCategories();
    return response;
  }

  @override
  Future<Either<IFailure, ItilCategoryEntity>> getCategoriesById(int id) async {
    final response = await _repository.getCategoriesById(id);
    return response;
  }
}
