import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:project_romance/features/inventory_management/data/models/category/paginated_all_category.dart';

abstract class AllCategoryState extends Equatable {
  final PaginatedAllCategory? paginatedAllCategories;
  final DioException? exception;

  const AllCategoryState({this.paginatedAllCategories, this.exception});

  @override
  List<Object> get props => [paginatedAllCategories!, exception!];
}

class AllCategoryLoading extends AllCategoryState {
  const AllCategoryLoading();
}

class AllCategorySuccess extends AllCategoryState {
  const AllCategorySuccess(PaginatedAllCategory paginatedAllCategories) : super(paginatedAllCategories: paginatedAllCategories);
}

class AllCategoryError extends AllCategoryState {
  const AllCategoryError(DioException exception) : super(exception: exception);
}
