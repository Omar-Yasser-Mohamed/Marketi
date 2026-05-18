class ReviewModel {
  final String id;
  final String review;
  final num rating;
  final String product;
  final String userId;
  final String userName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ReviewModel({
    required this.id,
    required this.review,
    required this.rating,
    required this.product,
    required this.userId,
    required this.userName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'] as String? ?? '',
      review: json['review'] as String? ?? '',
      rating: json['rating'] as num? ?? 0,
      product: json['product'] as String? ?? '',
      userId: (json['user'] as Map<String, dynamic>?)?['_id'] as String? ?? '',
      userName: (json['user'] as Map<String, dynamic>?)?['name'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now()
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'review': review,
      'rating': rating,
      'product': product,
      'user': {
        '_id': userId,
        'name': userName,
      },
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
