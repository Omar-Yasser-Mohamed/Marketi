import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/data/data_source/remote/products_remote_data_source.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/repos/products_repo.dart';

@LazySingleton(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  const ProductsRepoImpl(this._productsRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final List<ProductEntity> products = [];
      for (int page = 1; ; page++) {
        final data = await _productsRemoteDataSource.getAllProducts(page: page);
        if (data.isEmpty) break;
        products.addAll(data);
      }

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
}
