import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  const ContactEntity({
    this.id,
    this.name,
    this.value,
    this.contactType,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? value;
  final String? contactType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        value,
        contactType,
        createdAt,
        updatedAt,
      ];
}
