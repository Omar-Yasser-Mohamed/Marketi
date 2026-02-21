import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories({int page = 1});
}
