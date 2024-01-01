import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/models/contact/all_contact.dart';

abstract class SupportRepository {
  Future<DataState<AllContacts>> getAllContacts();
}
