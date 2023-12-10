import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_event.dart';
import 'package:project_romance/features/layout/presentation/bloc/layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(LayoutState(currentSubMenuIndex: 0, mainScreenWidget: Container())) {
    on<ChangeSubMenuLayoutEvent>(onChangeSubMenu);
    on<ChangeMainScreenEvent>(onChangeMainScreen);
  }

  FutureOr<void> onChangeSubMenu(ChangeSubMenuLayoutEvent event, Emitter<LayoutState> emit) {
    emit(LayoutState(currentSubMenuIndex: event.newIndex));
  }

  FutureOr<void> onChangeMainScreen(ChangeMainScreenEvent event, Emitter<LayoutState> emit) {
    emit(LayoutState(currentSubMenuIndex: state.currentSubMenuIndex, mainScreenWidget: event.widget));
  }
}
