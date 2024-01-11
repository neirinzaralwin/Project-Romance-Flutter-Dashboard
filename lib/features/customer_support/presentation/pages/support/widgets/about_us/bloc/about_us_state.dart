part of 'about_us_bloc.dart';

abstract class AboutUsState extends Equatable {
  final AboutUsEntity? aboutUs;
  final DioException? exception;

  const AboutUsState({this.aboutUs, this.exception});

  @override
  List<Object> get props => [aboutUs!, exception!];
}

class AboutUsLoading extends AboutUsState {
  const AboutUsLoading();
}

class AboutUsSuccess extends AboutUsState {
  const AboutUsSuccess(AboutUsEntity aboutUs) : super(aboutUs: aboutUs);
}

class AboutUsError extends AboutUsState {
  const AboutUsError(DioException exception) : super(exception: exception);
}
