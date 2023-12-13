import 'package:project_romance/di/service_locator.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:project_romance/features/inventory_management/domain/usecases/get_all_product.dart';

import 'all_products/bloc/all_product_bloc.dart';

class ProductDependency {
  static void register() {
    // Check if GetAllProductUseCase is already registered
    if (!sl.isRegistered<GetAllProductUseCase>()) sl.registerSingleton<GetAllProductUseCase>(GetAllProductUseCase(sl<InventoryRepository>()));
    // Check if AllProductBloc is already registered
    if (!sl.isRegistered<AllProductBloc>()) sl.registerFactory<AllProductBloc>(() => AllProductBloc(sl<GetAllProductUseCase>()));
  }
}
