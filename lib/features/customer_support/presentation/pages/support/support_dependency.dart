import 'package:project_romance/di/service_locator.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import 'package:project_romance/features/customer_support/domain/usecases/get_all_contacts.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/bloc/support_bloc.dart';

class SupportDependency {
  static void register() {
    if (!sl.isRegistered<GetAllContactsUseCase>()) {
      sl.registerSingleton<GetAllContactsUseCase>(
          GetAllContactsUseCase(sl<SupportRepository>()));
    }
    if (!sl.isRegistered<SupportBloc>()) {
      sl.registerFactory<SupportBloc>(
          () => SupportBloc(sl<GetAllContactsUseCase>()));
    }
  }
}
