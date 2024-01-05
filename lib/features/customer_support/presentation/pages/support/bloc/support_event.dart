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
