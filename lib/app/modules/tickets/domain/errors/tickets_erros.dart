import 'package:glpi_hoiol/app/core/errors/i_failure.dart';

class ListTicketError implements IFailure {
  @override
  String? message;
  @override
  StackTrace? stackTrace;

  ListTicketError({
    this.message = 'Erro no Carregamento dos Tickets',
    this.stackTrace,
  });
}

class ListCategoryError implements IFailure {
  @override
  String? message;
  @override
  StackTrace? stackTrace;

  ListCategoryError({
    this.message = 'Erro no Carregamento da Lista',
    this.stackTrace,
  });
}

class CategoryError implements IFailure {
  @override
  String? message;
  @override
  StackTrace? stackTrace;

  CategoryError({
    this.message = 'Categoria Não Localizada',
    this.stackTrace,
  });
}

class TicketError implements IFailure {
  @override
  String? message;
  @override
  StackTrace? stackTrace;

  TicketError({
    this.message = 'Ticket Não Localizado',
    this.stackTrace,
  });
}

class ErrorNotAuth implements IFailure {
  @override
  String? message;
  @override
  StackTrace? stackTrace;

  ErrorNotAuth({
    this.message = 'Acesso não autorizado',
    this.stackTrace,
  });
}

class PageNotFoundError implements IFailure {
  @override
  String? message;
  @override
  StackTrace? stackTrace;

  PageNotFoundError({
    this.message = 'Erro de Conexão com servidor - 404',
    this.stackTrace,
  });
}

class NotFoundedError implements IFailure {
  @override
  String? message;
  @override
  StackTrace? stackTrace;

  NotFoundedError({
    this.message = 'Ocorreu um erro não esperado.',
    this.stackTrace,
  });
}
