import 'dart:io';
import 'package:project_romance/core/repo_handler/repo_handler.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/data_sources/support_api_service.dart';
import 'package:project_romance/features/customer_support/data/models/contact/about_us.dart';
import 'package:project_romance/features/customer_support/data/models/contact/contact.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import 'package:project_romance/features/customer_support/domain/usecases/update_contact.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';

class SupportImplRepository implements SupportRepository {
  final SupportApiService supportApiService;
  SupportImplRepository(this.supportApiService);

  final RepoHandler standardRepoHandler = StandardRepoHandler();

  @override
  Future<DataState<List<Contact>>> getAllContacts() async {
    return standardRepoHandler.handle<List<Contact>>(
        await supportApiService.getAllContacts(), HttpStatus.ok);
  }

  @override
  Future<DataState<Contact>> createContact(
      CreateContactRequestModel request) async {
    return standardRepoHandler.handle<Contact>(
        await supportApiService.createContact(request), HttpStatus.created);
  }

  @override
  Future<DataState> deleteContact(int id) async {
    return standardRepoHandler.handle(
        await supportApiService.deleteContact(id), HttpStatus.ok);
  }

  @override
  Future<DataState> updateContact(UpdateContactParams param) async {
    final httpResponse = await supportApiService.updateContact(param.id, {
      "value": param.value,
    });
    return standardRepoHandler.handle(httpResponse, HttpStatus.ok);
  }

  // About us
  @override
  Future<DataState<AboutUs>> getAboutUs() async {
    return standardRepoHandler.handle<AboutUs>(
        await supportApiService.getAboutUs(), HttpStatus.ok);
  }

  @override
  Future<DataState> updateAboutUs(String text) async {
    final httpResponse = await supportApiService.updateAboutUs({
      "text": text,
    });
    return standardRepoHandler.handle(httpResponse, HttpStatus.ok);
  }
}
