import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/usecases/usecase.dart';
import 'package:project_romance/features/inventory_management/data/models/category/paginated_all_category.dart';

import '../repositories/inventory_repository.dart';

class GetAllCategoryUseCase
    implements UseCaseWithoutParams<DataState<PaginatedAllCategory>> {
  final InventoryRepository _inventoryRepository;

  GetAllCategoryUseCase(this._inventoryRepository);

  @override
  Future<DataState<PaginatedAllCategory>> call() {
    return _inventoryRepository.getAllCategory();
  }
}
