import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/getwidget.dart';
import 'package:project_romance/configs/theme/app_colors.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/resources/logger.dart';
import 'package:project_romance/core/shared_components/text_style/custom_text_style.dart';
import 'package:project_romance/features/customer_support/domain/entities/contact/about_us_entity.dart';
import 'package:project_romance/features/customer_support/domain/usecases/get_about_us.dart';
import 'package:project_romance/features/customer_support/domain/usecases/update_about_us.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/support_layout.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  final GetAboutUsUseCase _getAboutUsUseCase;
  final UpdateAboutUsUseCase _updateAboutUsUseCase;

  AboutUsBloc(this._getAboutUsUseCase, this._updateAboutUsUseCase)
      : super(const AboutUsLoading()) {
    on<GetAboutUsEvent>(onGetAboutUs);
    on<UpdateAboutUsEvent>(onUpdateAboutUs);
  }
  void onGetAboutUs(GetAboutUsEvent event, Emitter<AboutUsState> emit) async {
    emit(const AboutUsLoading());
    final dataState = await _getAboutUsUseCase();
    if (dataState is DataSuccess) {
      Logger.Green.log("✅ fetching aboutUs");
      emit(AboutUsSuccess(dataState.data ?? const AboutUsEntity(text: "")));
    }
    if (dataState is DataFailed) {
      Logger.Red.log("Error in getAboutUs ❌, reason ${dataState.error}");
      emit(AboutUsError(dataState.error!));
    }
  }

  void onUpdateAboutUs(
      UpdateAboutUsEvent event, Emitter<AboutUsState> emit) async {
    emit(const AboutUsLoading());
    final dataState = await _updateAboutUsUseCase(event.text);
    if (dataState is DataSuccess) {
      Logger.Green.log("✅ aboutus is updated");
      GFToast.showToast('Update about us successfully',
          SupportLayout.supportLayoutKey.currentContext!,
          backgroundColor: AppColor.greenDark,
          textStyle: bodyMedium.copyWith(
            color: AppColor.white,
          ),
          toastPosition: GFToastPosition.BOTTOM);
      add(const GetAboutUsEvent());
    }
    if (dataState is DataFailed) {
      Logger.Red.log("Error in update aboutus ❌, reason ${dataState.error}");
      emit(AboutUsError(dataState.error!));
    }
  }
}
