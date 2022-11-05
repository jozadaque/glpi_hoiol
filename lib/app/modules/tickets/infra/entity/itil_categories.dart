import '../../domain/entity/itil_category_entity.dart';

class ItilCategories implements ItilCategoryEntity {
  @override
  final int id;
  @override
  final String name;

  ItilCategories({
    required this.id,
    required this.name,
  });

  factory ItilCategories.fromJson(dynamic jsom) =>
      ItilCategories(id: jsom['id'], name: jsom['name']);
}
