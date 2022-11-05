abstract class CategoryEvent {}

class GetCategories implements CategoryEvent {}

class GetCategoryById implements CategoryEvent {
  final int id;

  GetCategoryById(this.id);
}
