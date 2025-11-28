import 'package:marketi/features/home/domain/entites/product_entity.dart';

import 'category_model.dart';
import 'brand_model.dart';
import 'sub_category_model.dart';

class ProductModel extends ProductEntity {
  num? sold;
  List<String>? productImages;
  List<SubCategoryModel>? subcategory;
  num? ratingsQuantity;
  String? productId;
  String? title;
  String? slug;
  String? productDescription;
  num? productQuantity;
  num? productPrice;
  String? imageCover;
  CategoryModel? productCategory;
  BrandModel? productBrand;
  num? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.sold,
    this.productImages,
    this.subcategory,
    this.ratingsQuantity,
    this.productId,
    this.title,
    this.slug,
    this.productDescription,
    this.productQuantity,
    this.productPrice,
    this.imageCover,
    this.productCategory,
    this.productBrand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  }) : super(
         id: productId ?? '',
         name: title ?? '',
         description: productDescription ?? '',
         image: imageCover ?? '',
         images: productImages ?? [],
         price: productPrice ?? 0,
         quantity: productQuantity ?? 0,
         category: productCategory?.categoryName ?? '',
         brand: productBrand?.brandName ?? '',
         avgRating: ratingsAverage ?? 0,
         ratingCount: ratingsQuantity ?? 0,
       );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    sold: json['sold'] as num?,
    productImages: json['images'] as List<String>?,
    subcategory: (json['subcategory'] as List<dynamic>?)
        ?.map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratingsQuantity: json['ratingsQuantity'] as num?,
    productId: json['_id'] as String?,
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    productDescription: json['description'] as String?,
    productQuantity: json['quantity'] as num?,
    productPrice: json['price'] as num?,
    imageCover: json['imageCover'] as String?,
    productCategory: json['category'] == null
        ? null
        : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    productBrand: json['brand'] == null
        ? null
        : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
    ratingsAverage: json['ratingsAverage'] as num?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'sold': sold,
    'images': productImages,
    'subcategory': subcategory?.map((e) => e.toJson()).toList(),
    'ratingsQuantity': ratingsQuantity,
    '_id': productId,
    'title': title,
    'slug': slug,
    'description': productDescription,
    'quantity': productQuantity,
    'price': productPrice,
    'imageCover': imageCover,
    'category': productCategory?.toJson(),
    'brand': productBrand?.toJson(),
    'ratingsAverage': ratingsAverage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'id': productId,
  };
}
