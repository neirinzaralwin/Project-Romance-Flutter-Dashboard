import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteContactUseCase implements UseCaseWithParams<DataState, int> {
  final SupportRepository _supportRepository;

  DeleteContactUseCase(this._supportRepository);

  @override
  Future<DataState> call(int id) {
    return _supportRepository.deleteContact(id);
  }
}
