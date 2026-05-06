import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

abstract class FavRepo {
  Future<Either<Failure, List<ProductEntity>>> getFavProducts();
  Future<Either<Failure, List<ProductEntity>>> addFavProduct(
    String productId,
  );
  Future<Either<Failure, List<ProductEntity>>> removeFavProduct(
    String productId,
  );
}
