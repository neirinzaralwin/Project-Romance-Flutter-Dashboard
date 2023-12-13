import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/usecases/usecase.dart';
import 'package:project_romance/features/inventory_management/data/models/category/paginated_all_category.dart';

import '../repositories/inventory_repository.dart';

class GetAllCategoryUseCase implements UseCase<DataState<PaginatedAllCategory>, void> {
  final InventoryRepository _inventoryRepository;

  GetAllCategoryUseCase(this._inventoryRepository);

  @override
  Future<DataState<PaginatedAllCategory>> call({void params}) {
    return _inventoryRepository.getAllCategory();
  }
}
