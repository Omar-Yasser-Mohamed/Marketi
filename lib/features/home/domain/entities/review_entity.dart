class ReviewEntity {
  final String id;
  final String review;
  final num rating;
  final String product;
  final String userId;
  final String userName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ReviewEntity({
    required this.id,
    required this.review,
    required this.rating,
    required this.product,
    required this.userId,
    required this.userName,
    required this.createdAt,
    required this.updatedAt,
  });
}
