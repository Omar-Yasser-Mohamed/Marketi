import 'package:marketi/features/home/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  final String? brandId;
  final String? brandName;
  final String? brandSlug;
  final String? brandImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BrandModel({
    required this.brandId,
    required this.brandName,
    required this.brandSlug,
    required this.brandImage,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
         id: brandId ?? '',
         name: brandName ?? '',
         image: brandImage ?? '',
       );

  factory BrandModel.fromJson(Map<String, dynamic> data) {
    return BrandModel(
      brandId: data["_id"] as String?,
      brandName: data["name"] as String?,
      brandSlug: data["slug"] as String?,
      brandImage: data["image"] as String?,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data["updatedAt"] == null
          ? null
          : (DateTime.parse(data["updatedAt"] as String)),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': brandId,
    'name': brandName,
    'slug': brandSlug,
    'image': brandImage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
