import 'package:project_romance/di/service_locator.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:project_romance/features/inventory_management/domain/usecases/get_all_category.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_bloc.dart';

class CategoryDependency {
  static void register() {
    if (!sl.isRegistered<GetAllCategoryUseCase>()) sl.registerSingleton<GetAllCategoryUseCase>(GetAllCategoryUseCase(sl<InventoryRepository>()));
    if (!sl.isRegistered<AllCategoryBloc>()) sl.registerFactory<AllCategoryBloc>(() => AllCategoryBloc(sl<GetAllCategoryUseCase>()));
  }
}
