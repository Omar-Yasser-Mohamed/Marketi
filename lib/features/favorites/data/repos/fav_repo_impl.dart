import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/favorites/data/data_sources/remote/fav_remote_data_source.dart';
import 'package:marketi/features/favorites/domain/repos/fav_repo.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

@LazySingleton(as: FavRepo)
class FavRepoImpl implements FavRepo {
  final FavRemoteDataSource _favRemoteDataSource;

  FavRepoImpl(this._favRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> addFavProduct(
    String productId,
  ) async {
    try {
      await _favRemoteDataSource.addFavProduct(productId);

      final products = await getFavProducts();

      return products;
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavProducts() async {
    try {
      final resposnse = await _favRemoteDataSource.getFavProducts();
      return right(resposnse);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> removeFavProduct(
    String productId,
  ) async {
    try {
      await _favRemoteDataSource.removeFavProduct(productId);

      final products = await getFavProducts();

      return products;
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
