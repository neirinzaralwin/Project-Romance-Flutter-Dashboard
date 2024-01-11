import 'package:project_romance/features/customer_support/domain/entities/contact/about_us_entity.dart';

class AboutUs extends AboutUsEntity {
  const AboutUs({
    super.id,
    super.text,
  });

  factory AboutUs.fromJson(Map<String, dynamic> json) {
    return AboutUs(
      id: json["id"] ?? 0,
      text: json["text"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}
