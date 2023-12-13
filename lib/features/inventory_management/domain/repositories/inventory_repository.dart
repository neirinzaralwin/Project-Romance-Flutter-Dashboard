import 'package:project_romance/features/inventory_management/data/models/category/paginated_all_category.dart';
import 'package:project_romance/features/inventory_management/data/models/product/paginated_all_product.dart';

import '../../../../core/resources/data_state.dart';

abstract class InventoryRepository {
  Future<DataState<PaginatedAllProduct>> getAllProducts();
  Future<DataState<PaginatedAllCategory>> getAllCategory();
}
