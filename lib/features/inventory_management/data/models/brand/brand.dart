import '../../../domain/entities/brand_entity.dart';

class Brand extends BrandEntity {
  const Brand({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Domain -----------------------------------------
  static Brand fromEntity(BrandEntity entity) {
    return Brand(id: entity.id, name: entity.name);
  }

  BrandEntity toEntity() {
    return BrandEntity(id: id, name: name);
  }
}
