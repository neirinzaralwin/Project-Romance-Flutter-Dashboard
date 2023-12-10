import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:project_romance/features/inventory_management/domain/entities/product_entity.dart';

abstract class AllProductState extends Equatable {
  final List<ProductEntity>? products;
  final DioException? exception;

  const AllProductState({this.products, this.exception});

  @override
  List<Object> get props => [products!, exception!];
}

class AllProductLoading extends AllProductState {
  const AllProductLoading();
}

class AllProductSuccess extends AllProductState {
  const AllProductSuccess(List<ProductEntity> products) : super(products: products);
}

class AllProductError extends AllProductState {
  const AllProductError(DioException exception) : super(exception: exception);
}
