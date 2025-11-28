import 'package:marketi/features/home/domain/entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  String? categoryId;
  String? categoryName;
  String? slug;
  String? categoryImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.slug,
    this.categoryImage,
    this.createdAt,
    this.updatedAt,
  }) : super(
    id: categoryId ?? '',
    image: categoryImage ?? '',
    name: categoryName ?? '',
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryId: json['_id'] as String?,
    categoryName: json['name'] as String?,
    slug: json['slug'] as String?,
    categoryImage: json['image'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    '_id': categoryId,
    'name': categoryName,
    'slug': slug,
    'image': categoryImage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
