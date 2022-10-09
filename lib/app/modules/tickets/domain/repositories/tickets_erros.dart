import 'package:glpi_hoiol/app/core/errors/i_failure.dart';

class ListTicketError implements IFailure {
  String? message;
  StackTrace? stackTrace;

  ListTicketError({
    this.message = 'Erro no Carregamento dos Tickets',
    this.stackTrace,
  });
}

class ListCategoryError implements IFailure {
  String? message;
  StackTrace? stackTrace;

  ListCategoryError({
    this.message = 'Erro no Carregamento da Lista',
    this.stackTrace,
  });
}

class CategoryError implements IFailure {
  String? message;
  StackTrace? stackTrace;

  CategoryError({
    this.message = 'Categoria Não Localizada',
    this.stackTrace,
  });
}

class TicketError implements IFailure {
  String? message;
  StackTrace? stackTrace;

  TicketError({
    this.message = 'Ticket Não Localizado',
    this.stackTrace,
  });
}
