import 'package:equatable/equatable.dart';
import 'contact.dart';

class AllContacts extends Equatable {
  const AllContacts({
    required this.data,
  });

  final List<Contact> data;

  factory AllContacts.fromJson(Map<String, dynamic> json) {
    return AllContacts(
      data: json["data"] == null
          ? []
          : List<Contact>.from(json["data"]!.map((x) => Contact.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        data,
      ];
}
