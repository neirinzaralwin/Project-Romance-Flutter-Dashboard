import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/inventory_management/data/models/product/product.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetProductDetailUseCase
    implements UseCaseWithParams<DataState<Product>, int> {
  final InventoryRepository _inventoryRepository;

  GetProductDetailUseCase(this._inventoryRepository);

  @override
  Future<DataState<Product>> call(int id) {
    return _inventoryRepository.getProductDetail(id);
  }
}
