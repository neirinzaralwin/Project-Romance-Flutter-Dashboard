enum ContactTypes {
  email,
  phone,
  facebook,
  messenger,
  viber,
  whatsapp,
  telegram,
}

class TempContactModel {
  String? name;
  ContactTypes? type;

  TempContactModel(this.name, this.type);
}
