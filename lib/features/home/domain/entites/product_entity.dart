class ProductEntity {
  final String id;
  final String name;
  final String image;
  final List<String> images;
  final String description;
  final num quantity;
  final num price;
  final num ratingCount;
  final num avgRating;
  final String category;
  final String brand;

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
  });
}
