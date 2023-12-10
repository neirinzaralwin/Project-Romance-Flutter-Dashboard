import 'package:project_romance/features/inventory_management/domain/entities/category_entity.dart';

class Category extends CategoryEntity {
  const Category({
    int? id,
    String? name,
    int? parentCategoryId,
  }) : super(id: id, name: name, parentCategoryId: parentCategoryId);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      parentCategoryId: json['parent_category_id'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'parent_category_id': parentCategoryId,
    };
  }

  // Domain -----------------------------------------
  static Category fromEntity(CategoryEntity entity) {
    return Category(id: entity.id, name: entity.name, parentCategoryId: entity.parentCategoryId);
  }

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, parentCategoryId: parentCategoryId);
  }
}
