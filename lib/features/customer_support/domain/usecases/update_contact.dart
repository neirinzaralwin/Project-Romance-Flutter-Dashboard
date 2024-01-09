import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateContactUseCase
    implements UseCaseWithParams<DataState, UpdateContactParams> {
  final SupportRepository _supportRepository;

  UpdateContactUseCase(this._supportRepository);

  @override
  Future<DataState> call(UpdateContactParams param) {
    return _supportRepository.updateContact(param);
  }
}

class UpdateContactParams {
  final int id;
  final String value;

  UpdateContactParams(this.id, this.value);
}
