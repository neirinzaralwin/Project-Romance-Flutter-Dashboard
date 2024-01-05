import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/models/contact/contact.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetAllContactsUseCase
    implements UseCaseWithoutParams<DataState<List<Contact>>> {
  final SupportRepository _supportRepository;

  GetAllContactsUseCase(this._supportRepository);

  @override
  Future<DataState<List<Contact>>> call({void params}) {
    return _supportRepository.getAllContacts();
  }
}
