import 'package:glpi_hoiol/app/modules/tickets/domain/entity/itil_category_entity.dart';

abstract class CategoryState {}

class InitialCategoryState implements CategoryState {}

class LoadingCategoryState implements CategoryState {}

class SuccessCategoryState implements CategoryState {
  final List<ItilCategoryEntity> categories;

  SuccessCategoryState(this.categories);
}

class SuccessCategoryIDState implements CategoryState {
  final ItilCategoryEntity category;

  SuccessCategoryIDState(this.category);
}

class ExceptionCategoryState implements CategoryState {
  final String mensage;
  final StackTrace? stackTrace;

  ExceptionCategoryState({
    required this.mensage,
    this.stackTrace,
  });
}
