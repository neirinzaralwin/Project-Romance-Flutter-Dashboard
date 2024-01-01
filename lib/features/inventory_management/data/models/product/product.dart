import 'package:project_romance/features/inventory_management/data/models/brand/brand.dart';
import 'package:project_romance/features/inventory_management/data/models/category/category.dart';
import 'package:project_romance/features/inventory_management/data/models/discount/discount.dart';
import 'package:project_romance/features/inventory_management/domain/entities/product_entity.dart';

class Product extends ProductEntity {
  const Product({
    int? id,
    Brand? brand,
    Category? category,
    double? discountPrice,
    List<Discount>? discounts,
    List<String>? images,
    String? name,
    int? price,
    int? stock,
    String? description,
    bool? isDigital,
  }) : super(
          id: id,
          brand: brand,
          category: category,
          discountPrice: discountPrice,
          discounts: discounts,
          images: images,
          name: name,
          price: price,
          stock: stock,
          description: description,
          isDigital: isDigital,
        );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      brand:
          json['brand'] != null ? Brand.fromJson(json['brand']) : const Brand(),
      category: json['category'] != null
          ? Category.fromJson(json['category'])
          : const Category(),
      discountPrice: json['discount_price'] ?? 0.0,
      discounts: json['discounts'] != null
          ? List<Discount>.from(
              json['discounts'].map((x) => Discount.fromJson(x)))
          : [],
      images: json['images'] != null
          ? List<String>.from(json['images'].map((x) => x))
          : [],
      name: json['name'] ?? "",
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
      description: json['description'] ?? "",
      isDigital: json['is_digital'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': Brand.fromEntity(brand!).toJson(),
      'category': Category.fromEntity(category!).toJson(),
      'discount_price': discountPrice,
      'discounts':
          discounts!.map((x) => Discount.fromEntity(x).toJson()).toList(),
      'images': images,
      'name': name,
      'price': price,
      'stock': stock,
      'description': description,
      'is_digital': isDigital,
    };
  }
}
