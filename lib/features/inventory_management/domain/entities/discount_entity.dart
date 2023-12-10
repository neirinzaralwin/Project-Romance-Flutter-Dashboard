import 'package:equatable/equatable.dart';

class DiscountEntity extends Equatable {
  const DiscountEntity({
    this.id,
    this.name,
    this.percentage,
  });

  final int? id;
  final String? name;
  final double? percentage;

  @override
  List<Object?> get props => [id, name, percentage];
}
