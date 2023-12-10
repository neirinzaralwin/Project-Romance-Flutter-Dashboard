import '../../../domain/entities/discount_entity.dart';

class Discount extends DiscountEntity {
  const Discount({
    int? id,
    String? name,
    double? percentage,
  }) : super(id: id, name: name, percentage: percentage);

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      percentage: json['percentage'] ?? 0.0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'percentage': percentage,
    };
  }

  // Domain -----------------------------------------
  static Discount fromEntity(DiscountEntity entity) {
    return Discount(id: entity.id, name: entity.name, percentage: entity.percentage);
  }

  DiscountEntity toEntity() {
    return DiscountEntity(id: id, name: name, percentage: percentage);
  }
}
