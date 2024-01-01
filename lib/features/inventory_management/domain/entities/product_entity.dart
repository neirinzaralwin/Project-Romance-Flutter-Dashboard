import 'package:equatable/equatable.dart';
import 'brand_entity.dart';
import 'category_entity.dart';
import 'discount_entity.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    this.id,
    this.brand,
    this.category,
    this.discountPrice,
    this.discounts,
    this.images,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.isDigital,
  });

  final int? id;
  final BrandEntity? brand;
  final CategoryEntity? category;
  final double? discountPrice;
  final List<DiscountEntity>? discounts;
  final List<String>? images;
  final String? name;
  final int? price;
  final int? stock;
  final String? description;
  final bool? isDigital;

  @override
  List<Object?> get props => [
        id,
        brand,
        category,
        discountPrice,
        stock,
        discounts,
        images,
        name,
        price,
        description,
        isDigital
      ];
}
