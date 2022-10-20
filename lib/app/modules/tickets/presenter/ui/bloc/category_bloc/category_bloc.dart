import 'package:bloc/bloc.dart';
import 'package:glpi_hoiol/app/modules/tickets/domain/usecase/ticket_usecase.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final TicketUsecase category;

  CategoryBloc(this.category) : super(InitialCategoryState()) {
    on(_getCategories);
    on(_getCategorysById);
  }

  Future<void> _getCategories(GetCategories event, emit) async {
    emit(LoadingCategoryState());

    final result = await category.getCategories();

    result.fold(
      (l) => emit(ExceptionCategoryState(mensage: l.toString())),
      (r) => emit(SuccessCategoryState(r)),
    );
  }

  Future<void> _getCategorysById(GetCategoryById event, emit) async {
    emit(LoadingCategoryState());

    final result = await category.getCategoriesById(event.id);

    result.fold(
      (l) => emit(ExceptionCategoryState(mensage: l.toString())),
      (r) => emit(SuccessCategoryIDState(r)),
    );
  }
}
