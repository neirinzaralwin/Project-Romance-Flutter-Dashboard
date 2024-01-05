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
  const AllProductSuccess(List<ProductEntity> products)
      : super(products: products);
}

class AllProductError extends AllProductState {
  const AllProductError(DioException exception) : super(exception: exception);
}

// abstract class GetProductDetailState extends Equatable {
//   final ProductEntity? product;
//   final DioException? exception;

//   const GetProductDetailState({this.product, this.exception});

//   @override
//   List<Object> get props => [product!, exception!];
// }

// class ProductLoading extends GetProductDetailState {
//   const ProductLoading();
// }

// class ProductSuccess extends GetProductDetailState {
//   const ProductSuccess(ProductEntity product) : super(product: product);
// }

// class ProductError extends GetProductDetailState {
//   const ProductError(DioException exception) : super(exception: exception);
// }
