import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/favourites/data/data_source/remote/favorites_remote_data_source.dart';
import 'package:marketi/features/favourites/domain/repos/favorites_repo.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

@LazySingleton(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepoImpl(this.favoritesRemoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> addToFavorites({
    required String productId,
  }) async {
    try {
      final favProducts = await favoritesRemoteDataSource.addToFavorites(
        productId: productId,
      );

      return right(favProducts);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFavorites() async {
    try {
      final favProducts = await favoritesRemoteDataSource.getFavorites();

      return right(favProducts);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> removeFromFavorites({
    required String productId,
  }) async {
    try {
      final favProducts = await favoritesRemoteDataSource.removeFromFavorites(
        productId: productId,
      );

      return right(favProducts);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
