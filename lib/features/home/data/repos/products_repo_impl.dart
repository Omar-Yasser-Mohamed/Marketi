import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/data/data_source/remote/products_remote_data_source.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/repos/products_repo.dart';
import 'package:hive/hive.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:marketi/core/constansts/hive_constants.dart';

@LazySingleton(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  const ProductsRepoImpl(this._productsRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts({int page = 1}) async {
    try {
      final data = await _productsRemoteDataSource.getAllProducts(page: page);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> cachProducts() async {
    try {
      final box = await Hive.openBox(HiveConstants.productsCacheBox);
      final List<dynamic>? cachedList = box.get(HiveConstants.productsCacheKey) as List<dynamic>?;

      if (cachedList != null && cachedList.isNotEmpty) {
        final List<ProductEntity> products = cachedList.map((e) {
          return ProductModel.fromJson(Map<String, dynamic>.from(e as Map));
        }).toList();
        return right(products);
      }

      final List<ProductEntity> products = [];
      for (int page = 1; ; page++) {
        final data = await _productsRemoteDataSource.getAllProducts(page: page);
        if (data.isEmpty) break;
        products.addAll(data);
      }

      final List<Map<String, dynamic>> dataToCache = products.map((e) {
        if (e is ProductModel) {
          return e.toJson();
        }
        return ProductModel(
          productId: e.id,
          productTitle: e.title,
          productDescription: e.description,
          productImageCover: e.imageCover,
          productImages: e.images,
          productQuantity: e.quantity,
          productPrice: e.price,
          ratingsQuantity: e.ratingCount,
          ratingsAverage: e.avgRating,
          productSold: e.sold,
          productPriceAfterDiscount: e.priceAfterDiscount,
          productCategory: CategoryModel(
            categoryId: e.category.id,
            categoryName: e.category.name,
            categoryImage: e.category.image,
            slug: '',
            createdAt: null,
            updatedAt: null,
          ),
          productBrand: BrandModel(
            brandId: e.brand.id,
            brandName: e.brand.name,
            brandImage: e.brand.image,
            brandSlug: '',
            createdAt: null,
            updatedAt: null,
          ),
        ).toJson();
      }).toList();

      await box.put(HiveConstants.productsCacheKey, dataToCache);

      return right(products);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(String id) async {
    try {
      final product = await _productsRemoteDataSource.getProductById(id);
      return right(product);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts({int page = 1}) async {
    try {
      final data = await _productsRemoteDataSource.getPopularProducts(page: page);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestProducts({int page = 1}) async {
    try {
      final data = await _productsRemoteDataSource.getBestProducts(page: page);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
