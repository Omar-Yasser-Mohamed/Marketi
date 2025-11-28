import 'package:marketi/features/home/domain/entites/brand_entity.dart';

class BrandModel extends BrandEntity {
  String? brandId;
  String? brandName;
  String? slug;
  String? brandImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  BrandModel({
    this.brandId,
    this.brandName,
    this.slug,
    this.brandImage,
    this.createdAt,
    this.updatedAt,
  }) : super(
         id: brandId ?? '',
         name: brandName ?? '',
         image: brandName ?? '',
       );

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    brandId: json['_id'] as String?,
    brandName: json['name'] as String?,
    slug: json['slug'] as String?,
    brandImage: json['image'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    '_id': brandId,
    'name': brandName,
    'slug': slug,
    'image': brandImage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
