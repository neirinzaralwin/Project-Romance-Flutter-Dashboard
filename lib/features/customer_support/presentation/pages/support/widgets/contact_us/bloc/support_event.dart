import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';

abstract class SupportEvent {
  const SupportEvent();
}

class GetAllContactsEvent extends SupportEvent {
  const GetAllContactsEvent();
}

class CreateContactEvent extends SupportEvent {
  CreateContactRequestModel request;
  CreateContactEvent(this.request);
}

class DeleteContactEvent extends SupportEvent {
  int id;
  DeleteContactEvent(this.id);
}

class UpdateContactEvent extends SupportEvent {
  int id;
  String value;
  UpdateContactEvent(this.id, this.value);
}
