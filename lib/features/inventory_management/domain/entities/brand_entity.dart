import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  const BrandEntity({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
