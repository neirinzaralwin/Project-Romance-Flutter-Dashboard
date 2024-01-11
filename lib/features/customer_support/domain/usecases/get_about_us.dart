import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/models/contact/about_us.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetAboutUsUseCase implements UseCaseWithoutParams<DataState<AboutUs>> {
  final SupportRepository _supportRepository;

  GetAboutUsUseCase(this._supportRepository);

  @override
  Future<DataState<AboutUs>> call() {
    return _supportRepository.getAboutUs();
  }
}
