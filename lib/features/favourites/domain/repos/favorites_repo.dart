import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, List<ProductEntity>>> getFavorites();
  Future<Either<Failure, List<ProductEntity>>> addToFavorites({
    required String productId,
  });
  Future<Either<Failure, List<ProductEntity>>> removeFromFavorites({
    required String productId,
  });
}
