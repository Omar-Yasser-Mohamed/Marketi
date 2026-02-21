import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

import 'category_model.dart';
import 'brand_model.dart';
import 'sub_category_model.dart';

class ProductModel extends ProductEntity {
  num? productSold;
  List<dynamic>? productImages;
  List<SubCategoryModel>? subcategory;
  num? ratingsQuantity;
  String? productId;
  String? productTitle;
  String? slug;
  String? productDescription;
  num? productQuantity;
  num? productPrice;
  num? productPriceAfterDiscount;
  String? productImageCover;
  CategoryModel? productCategory;
  BrandModel? productBrand;
  num? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.productSold,
    this.productImages,
    this.subcategory,
    this.ratingsQuantity,
    this.productId,
    this.productTitle,
    this.slug,
    this.productDescription,
    this.productQuantity,
    this.productPrice,
    this.productImageCover,
    this.productCategory,
    this.productBrand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.productPriceAfterDiscount,
  }) : super(
         id: productId ?? '',
         title: productTitle ?? '',
         description: productDescription ?? '',
         imageCover: productImageCover ?? '',
         images: productImages?.map((e) => e.toString()).toList() ?? [],
         quantity: productQuantity ?? 0,
         price: productPrice ?? 0,
         ratingCount: ratingsQuantity ?? 0,
         avgRating: ratingsAverage ?? 0,
         category: CategoryEntity(
           id: productCategory?.id ?? '',
           name: productCategory?.name ?? '',
           image: productCategory?.image ?? '',
         ),
         brand: BrandEntity(
           id: productBrand?.id ?? '',
           name: productBrand?.name ?? '',
           image: productBrand?.image ?? '',
         ),
         sold: productSold ?? 0,
       );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productSold: json['sold'] as num?,
    productImages: json['images'] as List<dynamic>?,
    subcategory: (json['subcategory'] as List<dynamic>?)
        ?.map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratingsQuantity: json['ratingsQuantity'] as num?,
    productId: json['_id'] as String?,
    productTitle: json['title'] as String?,
    slug: json['slug'] as String?,
    productDescription: json['description'] as String?,
    productQuantity: json['quantity'] as num?,
    productPrice: json['price'] as num?,
    productPriceAfterDiscount: json['priceAfterDiscount'] as num?,
    productImageCover: json['imageCover'] as String?,
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
    'sold': productSold,
    'images': productImages,
    'subcategory': subcategory?.map((e) => e.toJson()).toList(),
    'ratingsQuantity': ratingsQuantity,
    '_id': productId,
    'title': productTitle,
    'slug': slug,
    'description': productDescription,
    'quantity': productQuantity,
    'price': productPrice,
    'imageCover': productImageCover,
    'category': productCategory?.toJson(),
    'brand': productBrand?.toJson(),
    'ratingsAverage': ratingsAverage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'id': productId,
  };
}
