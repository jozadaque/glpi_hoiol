import 'dart:developer';

import 'package:glpi_hoiol/app/modules/tickets/domain/entity/ticket_entity.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/entity/itil_category_entity.dart';
import 'package:glpi_hoiol/app/core/errors/i_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/errors/tickets_erros.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/repositories/i_ticket_repository.dart';

import '../datasources/i_ticket_datasource.dart';

class TicketRepositoryImpl extends ITicketRepository {
  final ITicketDatasource _datasource;

  TicketRepositoryImpl(this._datasource);

  @override
  Future<Either<IFailure, List<TicketEntity>>> getTickets() async {
    try {
      final response = await _datasource.getTickets();

      return right(response);
    } on ListTicketError catch (e) {
      log('aqui');
      return left(ListTicketError(message: e.toString()));
    }
  }

  @override
  Future<Either<IFailure, List<ItilCategoryEntity>>> getCategories() async {
    try {
      final response = await _datasource.getCategories();
      return right(response);
    } on IFailure catch (e) {
      return left(ListCategoryError(message: e.message.toString()));
    }
  }

  @override
  Future<Either<IFailure, TicketEntity>> getTicketById(int id) async {
    try {
      final response = await _datasource.getTicketById(id);
      return right(response);
    } on IFailure catch (e) {
      return left(TicketError(message: e.message.toString()));
    }
  }

  @override
  Future<Either<IFailure, ItilCategoryEntity>> getCategoriesById(int id) async {
    try {
      final response = await _datasource.getCategoryById(id);
      return right(response);
    } on IFailure catch (e) {
      return left(CategoryError(message: e.message.toString()));
    }
  }
}
