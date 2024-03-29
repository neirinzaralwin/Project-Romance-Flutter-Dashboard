import 'package:project_romance/di/service_locator.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import 'package:project_romance/features/customer_support/domain/usecases/create_contact.dart';
import 'package:project_romance/features/customer_support/domain/usecases/delete_contact.dart';
import 'package:project_romance/features/customer_support/domain/usecases/get_about_us.dart';
import 'package:project_romance/features/customer_support/domain/usecases/get_all_contacts.dart';
import 'package:project_romance/features/customer_support/domain/usecases/update_about_us.dart';
import 'package:project_romance/features/customer_support/domain/usecases/update_contact.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/widgets/about_us/bloc/about_us_bloc.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/widgets/contact_us/bloc/support_bloc.dart';

class SupportDependency {
  static void register() {
    if (!sl.isRegistered<GetAllContactsUseCase>()) {
      sl.registerSingleton<GetAllContactsUseCase>(
          GetAllContactsUseCase(sl<SupportRepository>()));
    }
    if (!sl.isRegistered<CreateContactUseCase>()) {
      sl.registerSingleton<CreateContactUseCase>(
          CreateContactUseCase(sl<SupportRepository>()));
    }
    if (!sl.isRegistered<DeleteContactUseCase>()) {
      sl.registerSingleton<DeleteContactUseCase>(
          DeleteContactUseCase(sl<SupportRepository>()));
    }
    if (!sl.isRegistered<UpdateContactUseCase>()) {
      sl.registerSingleton<UpdateContactUseCase>(
          UpdateContactUseCase(sl<SupportRepository>()));
    }

    if (!sl.isRegistered<SupportBloc>()) {
      sl.registerFactory<SupportBloc>(() => SupportBloc(
          sl<GetAllContactsUseCase>(),
          sl<CreateContactUseCase>(),
          sl<DeleteContactUseCase>(),
          sl<UpdateContactUseCase>()));
    }

    // about us
    if (!sl.isRegistered<GetAboutUsUseCase>()) {
      sl.registerSingleton<GetAboutUsUseCase>(
          GetAboutUsUseCase(sl<SupportRepository>()));
    }

    if (!sl.isRegistered<UpdateAboutUsUseCase>()) {
      sl.registerSingleton<UpdateAboutUsUseCase>(
          UpdateAboutUsUseCase(sl<SupportRepository>()));
    }

    if (!sl.isRegistered<AboutUsBloc>()) {
      sl.registerFactory<AboutUsBloc>(() =>
          AboutUsBloc(sl<GetAboutUsUseCase>(), sl<UpdateAboutUsUseCase>()));
    }
  }
}
