import 'package:equatable/equatable.dart';

class AboutUsEntity extends Equatable {
  const AboutUsEntity({
    this.id,
    this.text,
  });

  final int? id;
  final String? text;

  @override
  List<Object?> get props => [
        id,
        text,
      ];
}
