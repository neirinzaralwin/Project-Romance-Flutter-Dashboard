import 'dart:io';
import 'package:dio/dio.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/inventory_management/data/data_sources/inventory_api_service.dart';
import 'package:project_romance/features/inventory_management/data/models/category/paginated_all_category.dart';
import 'package:project_romance/features/inventory_management/data/models/product/paginated_all_product.dart';
import 'package:project_romance/features/inventory_management/data/models/product/product.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';

class InventoryImplRepository implements InventoryRepository {
  final InventoryApiService inventoryApiService;
  InventoryImplRepository(this.inventoryApiService);

  @override
  Future<DataState<PaginatedAllProduct>> getAllProducts() async {
    try {
      final httpResponse = await inventoryApiService.getAllProducts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.data,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Product>> getProductDetail(int productId) async {
    try {
      final httpResponse =
          await inventoryApiService.getProductDetail(productId);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.data,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<PaginatedAllCategory>> getAllCategory() async {
    try {
      final httpResponse = await inventoryApiService.getAllCategories();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.data,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
