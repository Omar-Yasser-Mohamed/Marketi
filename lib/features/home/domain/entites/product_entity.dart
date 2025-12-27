import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';

class ProductEntity {
  final String id;
  final String name;
  final String image;
  final List<String> images;
  final String description;
  final num quantity;
  final num price;
  final num? priceAfterDiscount;
  final num ratingCount;
  final num avgRating;
  final CategoryEntity category;
  final BrandEntity brand;

  ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.images,
    required this.description,
    required this.quantity,
    required this.price,
    required this.ratingCount,
    required this.avgRating,
    required this.brand,
    required this.category,
    this.priceAfterDiscount
  });
}
