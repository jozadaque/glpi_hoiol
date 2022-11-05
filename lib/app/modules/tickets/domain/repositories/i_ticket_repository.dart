import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/core/errors/i_failure.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/itil_category_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/ticket_entity.dart';

abstract class ITicketRepository {
  Future<Either<IFailure, List<TicketEntity>>> getTickets();
  Future<Either<IFailure, TicketEntity>> getTicketById(int id);
  Future<Either<IFailure, List<ItilCategoryEntity>>> getCategories();
  Future<Either<IFailure, ItilCategoryEntity>> getCategoriesById(int id);
}
