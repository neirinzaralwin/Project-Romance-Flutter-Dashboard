import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    this.id,
    this.name,
    this.parentCategoryId,
  });

  final int? id;
  final String? name;
  final int? parentCategoryId;

  @override
  List<Object?> get props => [id, name, parentCategoryId];
}
