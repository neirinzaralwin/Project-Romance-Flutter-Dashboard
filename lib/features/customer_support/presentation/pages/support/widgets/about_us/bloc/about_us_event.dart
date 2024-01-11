part of 'about_us_bloc.dart';

abstract class AboutUsEvent {
  const AboutUsEvent();
}

class GetAboutUsEvent extends AboutUsEvent {
  const GetAboutUsEvent();
}

class UpdateAboutUsEvent extends AboutUsEvent {
  String text;
  UpdateAboutUsEvent(this.text);
}
