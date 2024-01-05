import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/models/contact/contact.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';
import '../../../../core/usecases/usecase.dart';

class CreateContactUseCase
    implements
        UseCaseWithParams<DataState<Contact>, CreateContactRequestModel> {
  final SupportRepository _supportRepository;

  CreateContactUseCase(this._supportRepository);

  @override
  Future<DataState<Contact>> call(CreateContactRequestModel request) {
    return _supportRepository.createContact(request);
  }
}
