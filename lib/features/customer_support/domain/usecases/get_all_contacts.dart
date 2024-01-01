import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/models/contact/all_contact.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetAllContactsUseCase implements UseCase<DataState<AllContacts>, void> {
  final SupportRepository _supportRepository;

  GetAllContactsUseCase(this._supportRepository);

  @override
  Future<DataState<AllContacts>> call({void params}) {
    return _supportRepository.getAllContacts();
  }
}
