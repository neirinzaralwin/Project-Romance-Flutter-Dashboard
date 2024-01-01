import 'package:project_romance/features/customer_support/domain/entities/contact/contact_entity.dart';

class Contact extends ContactEntity {
  const Contact({
    int? id,
    String? name,
    String? value,
    String? contactType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          value: value,
          contactType: contactType,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      value: json["value"] ?? "",
      contactType: json["contact_type"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "contact_type": contactType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
