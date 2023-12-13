import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/resources/logger.dart';
import 'package:project_romance/features/inventory_management/domain/usecases/get_all_category.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_event.dart';
import 'package:project_romance/features/inventory_management/presentation/pages/category/all_categories/bloc/all_category_state.dart';

class AllCategoryBloc extends Bloc<AllCategoryEvent, AllCategoryState> {
  final GetAllCategoryUseCase _getAllCategoryUseCase;

  AllCategoryBloc(this._getAllCategoryUseCase) : super(const AllCategoryLoading()) {
    on<GetAllCategoryEvent>(onGetAllCategory);
  }

  void onGetAllCategory(GetAllCategoryEvent event, Emitter<AllCategoryState> emit) async {
    emit(const AllCategoryLoading());
    final dataState = await _getAllCategoryUseCase();
    if (dataState is DataSuccess) {
      Logger.Green.log("✅ fetching all categories");
      emit(AllCategorySuccess(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(AllCategoryError(dataState.error!));
    }
  }
}
