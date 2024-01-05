import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/inventory_management/data/models/product/paginated_all_product.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetAllProductUseCase
    implements UseCaseWithoutParams<DataState<PaginatedAllProduct>> {
  final InventoryRepository _inventoryRepository;

  GetAllProductUseCase(this._inventoryRepository);

  @override
  Future<DataState<PaginatedAllProduct>> call() {
    return _inventoryRepository.getAllProducts();
  }
}
