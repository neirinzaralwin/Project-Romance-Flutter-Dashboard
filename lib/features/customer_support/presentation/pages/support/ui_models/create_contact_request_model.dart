import 'package:equatable/equatable.dart';

class CreateContactRequestModel extends Equatable {
  const CreateContactRequestModel({
    required this.name,
    required this.value,
    required this.contactType,
  });

  final String name;
  final String value;
  final String contactType;

  factory CreateContactRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateContactRequestModel(
      name: json["name"] ?? "",
      value: json["value"] ?? "",
      contactType: json["contact_type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "contact_type": contactType,
      };

  @override
  List<Object?> get props => [
        name,
        value,
        contactType,
      ];
}
