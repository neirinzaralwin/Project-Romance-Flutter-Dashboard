import 'package:equatable/equatable.dart';
import 'package:project_romance/features/inventory_management/data/models/product/product.dart';

class PaginatedAllProduct extends Equatable {
  const PaginatedAllProduct({
    required this.total,
    required this.page,
    required this.hasMorePages,
    required this.limit,
    required this.data,
  });

  final int total;
  final int page;
  final bool hasMorePages;
  final int limit;
  final List<Product> data;

  factory PaginatedAllProduct.fromJson(Map<String, dynamic> json) {
    return PaginatedAllProduct(
      total: json["total"] ?? 0,
      page: json["page"] ?? 0,
      hasMorePages: json["has_more_pages"] ?? false,
      limit: json["limit"] ?? 0,
      data: json["data"] == null ? [] : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "has_more_pages": hasMorePages,
        "limit": limit,
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        total,
        page,
        hasMorePages,
        limit,
        data,
      ];
}
