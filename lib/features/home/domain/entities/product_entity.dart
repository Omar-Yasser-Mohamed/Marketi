import 'package:marketi/features/home/domain/entities/review_entity.dart';

import 'brand_entity.dart';
import 'category_entity.dart';

class ProductEntity {
  final String id;
  final String title;
  final String description;
  final String imageCover;
  final List<String> images;
  final num quantity;
  final num price;
  final num? priceAfterDiscount;
  final num ratingCount;
  final num avgRating;
  final num sold;
  final CategoryEntity category;
  final BrandEntity brand;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageCover,
    required this.images,
    required this.quantity,
    required this.price,
    required this.ratingCount,
    required this.avgRating,
    required this.category,
    required this.brand,
    required this.sold,
    this.priceAfterDiscount,
    required this.reviews,
  });
}
