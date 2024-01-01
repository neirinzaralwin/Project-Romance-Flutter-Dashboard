import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_romance/core/exceptions/error_exceptions.dart';
import 'package:project_romance/features/customer_support/data/data_sources/support_api_service.dart';
import 'package:project_romance/features/customer_support/data/repository/support_impl_respository.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/support_dependency.dart';
import 'package:project_romance/features/inventory_management/data/data_sources/inventory_api_service.dart';
import 'package:project_romance/features/inventory_management/data/repository/inventory_impl_repository.dart';
import 'package:project_romance/features/inventory_management/domain/repositories/inventory_repository.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_bloc.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/category_dependency.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/product/product_dependency.dart';

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
            return handler
                .resolve(Response(requestOptions: exception.requestOptions));
          default:
        }

        return handler.next(exception);
      },
    ),
  );

  sl.registerSingleton<Dio>(dio);

  // Service
  sl.registerSingleton<InventoryApiService>(InventoryApiService(sl<Dio>()));
  sl.registerSingleton<SupportApiService>(SupportApiService(sl<Dio>()));

  // Inventory
  sl.registerSingleton<InventoryRepository>(
      InventoryImplRepository(sl<InventoryApiService>()));
  sl.registerSingleton<SupportRepository>(
      SupportImplRepository(sl<SupportApiService>()));

  // UseCases

  // Blocs
  sl.registerFactory<LayoutBloc>(() => LayoutBloc());

  // Custom dependencies
  ProductDependency.register();
  CategoryDependency.register();
  SupportDependency.register();
}
