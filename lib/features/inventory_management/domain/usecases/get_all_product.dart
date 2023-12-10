import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/inventory_management/data/models/product/paginated_all_product.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetAllProductUseCase implements UseCase<DataState<PaginatedAllProduct>, void> {
  final InventoryRepository _inventoryRepository;

  GetAllProductUseCase(this._inventoryRepository);

  @override
  Future<DataState<PaginatedAllProduct>> call({void params}) {
    return _inventoryRepository.getAllProducts();
  }
}
