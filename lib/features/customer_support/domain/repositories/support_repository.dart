import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/models/contact/contact.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';

abstract class SupportRepository {
  Future<DataState<List<Contact>>> getAllContacts();
  Future<DataState<Contact>> createContact(CreateContactRequestModel request);
}
