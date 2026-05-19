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
  List<ProductEntity>? _cachedProducts;

  ProductsRepoImpl(this._productsRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts({
    int page = 1,
  }) async {
    try {
      final data = await _productsRemoteDataSource.getAllProducts(page: page);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  Map<String, dynamic> _recursiveConvert(Map<dynamic, dynamic> map) {
    return map.map((key, value) {
      final stringKey = key.toString();
      if (value is Map) {
        return MapEntry(stringKey, _recursiveConvert(value));
      } else if (value is List) {
        return MapEntry(stringKey, _recursiveConvertList(value));
      }
      return MapEntry(stringKey, value);
    });
  }

  List<dynamic> _recursiveConvertList(List<dynamic> list) {
    return list.map((item) {
      if (item is Map) {
        return _recursiveConvert(item);
      } else if (item is List) {
        return _recursiveConvertList(item);
      }
      return item;
    }).toList();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> cachProducts() async {
    try {
      if (_cachedProducts != null && _cachedProducts!.isNotEmpty) {
        return right(_cachedProducts!);
      }

      final box = await Hive.openBox(HiveConstants.productsCacheBox);
      final List<dynamic>? cachedList =
          box.get(HiveConstants.productsCacheKey) as List<dynamic>?;

      if (cachedList != null && cachedList.isNotEmpty) {
        final List<ProductEntity> products = cachedList.map((e) {
          return ProductModel.fromJson(_recursiveConvert(e as Map));
        }).toList();
        _cachedProducts = products;
        return right(products);
      }

      _cachedProducts = [];
      final List<ProductEntity> products = [];
      for (int page = 1; ; page++) {
        final data = await _productsRemoteDataSource.getAllProducts(page: page);
        if (data.isEmpty) break;
        _cachedProducts?.addAll(data);
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
      _cachedProducts = products;

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
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts({
    int page = 1,
  }) async {
    try {
      final data = await _productsRemoteDataSource.getPopularProducts(
        page: page,
      );
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestProducts({
    int page = 1,
  }) async {
    try {
      final data = await _productsRemoteDataSource.getBestProducts(page: page);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByBrand({
    required String brandId,
    int page = 1,
  }) async {
    try {
      final data = await _productsRemoteDataSource.getProductsByBrand(
        brandId: brandId,
        page: page,
      );
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({
    required String categoryId,
    int page = 1,
  }) async {
    try {
      final data = await _productsRemoteDataSource.getProductsByCategory(
        categoryId: categoryId,
        page: page,
      );
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({
    required String query,
  }) async {
    try {
      if (_cachedProducts == null || _cachedProducts!.isEmpty) {
        final box = await Hive.openBox(HiveConstants.productsCacheBox);
        final List<dynamic>? cachedList =
            box.get(HiveConstants.productsCacheKey) as List<dynamic>?;

        if (cachedList != null && cachedList.isNotEmpty) {
          _cachedProducts = cachedList.map((e) {
            return ProductModel.fromJson(_recursiveConvert(e as Map));
          }).toList();
        } else {
          _cachedProducts = [];
        }
      }

      final filteredProducts = _cachedProducts!
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      return right(filteredProducts);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
