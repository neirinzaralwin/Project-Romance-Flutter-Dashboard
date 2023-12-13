import 'package:project_romance/core/constants/api_constants.dart';
import 'package:project_romance/features/inventory_management/data/models/category/paginated_all_category.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/product/paginated_all_product.dart';
part 'inventory_api_service.g.dart';

@RestApi(baseUrl: ApiConst.baseUrl)
abstract class InventoryApiService {
  factory InventoryApiService(Dio dio) = _InventoryApiService;

  @GET(ApiConst.allProducts)
  Future<HttpResponse<PaginatedAllProduct>> getAllProducts();

  @GET(ApiConst.allCategories)
  Future<HttpResponse<PaginatedAllCategory>> getAllCategories();
}
