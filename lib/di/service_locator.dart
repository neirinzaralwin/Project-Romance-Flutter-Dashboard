import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_romance/core/exceptions/error_exceptions.dart';
import 'package:project_romance/features/inventory_management/data/data_sources/inventory_api_service.dart';
import 'package:project_romance/features/inventory_management/data/repository/inventory_impl_repository.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:project_romance/features/inventory_management/domain/usecases/get_all_product.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_bloc.dart';

import '../features/inventory_management/presentation/pages/product/all_products/bloc/all_product_bloc.dart';

final sl = GetIt.instance;
serviceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dio
  Dio dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        String authToken =
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZXhwIjoxNzA4NzYyNTM0LCJpYXQiOjE3MDA5ODY1MzR9.EDH7Kf_318YQrFjc8M68_c5azmw4Ii9chRPhlMdQEjY";
        options.headers["Authorization"] = "Bearer $authToken";
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioException exception, ErrorInterceptorHandler handler) {
        switch (exception.type) {
          case DioExceptionType.connectionError:
            debugPrint("Connection Error");
            return handler.next(ErrorException(exception).connectionTimeout);
          case DioExceptionType.unknown:
            debugPrint("Resolved");
            return handler.resolve(Response(requestOptions: exception.requestOptions));
          default:
        }

        return handler.next(exception);
      },
    ),
  );

  sl.registerSingleton<Dio>(dio);

  // Service
  sl.registerSingleton<InventoryApiService>(InventoryApiService(sl<Dio>()));

  // Inventory
  sl.registerSingleton<InventoryRepository>(InventoryImplRepository(sl<InventoryApiService>()));

  //UseCases
  sl.registerSingleton<GetAllProductUseCase>(GetAllProductUseCase(sl<InventoryRepository>()));

  //Blocs
  sl.registerFactory<LayoutBloc>(() => LayoutBloc());
  sl.registerFactory<AllProductBloc>(() => AllProductBloc(sl<GetAllProductUseCase>()));
}
