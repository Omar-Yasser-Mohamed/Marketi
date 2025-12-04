import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
}
