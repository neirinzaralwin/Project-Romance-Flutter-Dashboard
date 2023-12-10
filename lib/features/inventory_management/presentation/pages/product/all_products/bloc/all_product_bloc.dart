import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/resources/logger.dart';

import '../../../../../domain/usecases/get_all_product.dart';
import 'all_product_event.dart';
import 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final GetAllProductUseCase _getAllProductUseCase;

  AllProductBloc(this._getAllProductUseCase) : super(const AllProductLoading()) {
    on<GetAllProductsEvent>(onGetAllProduct);
  }

  void onGetAllProduct(GetAllProductsEvent event, Emitter<AllProductState> emit) async {
    emit(const AllProductLoading());
    final dataState = await _getAllProductUseCase();
    if (dataState is DataSuccess) {
      Logger.Green.log("✅ fetching all products");
      emit(AllProductSuccess(dataState.data?.data ?? []));
    }
    if (dataState is DataFailed) {
      emit(AllProductError(dataState.error!));
    }
  }
}
