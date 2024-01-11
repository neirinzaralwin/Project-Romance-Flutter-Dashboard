import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateAboutUsUseCase implements UseCaseWithParams<DataState, String> {
  final SupportRepository _supportRepository;

  UpdateAboutUsUseCase(this._supportRepository);

  @override
  Future<DataState> call(String text) {
    return _supportRepository.updateAboutUs(text);
  }
}
