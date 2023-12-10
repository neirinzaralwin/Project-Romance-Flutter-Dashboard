import 'package:flutter/material.dart';

abstract class LayoutEvent {
  const LayoutEvent();
}

class ChangeSubMenuLayoutEvent extends LayoutEvent {
  final int newIndex;
  const ChangeSubMenuLayoutEvent(this.newIndex);
}

class ChangeMainScreenEvent extends LayoutEvent {
  final Widget? widget;
  ChangeMainScreenEvent(this.widget);
}
