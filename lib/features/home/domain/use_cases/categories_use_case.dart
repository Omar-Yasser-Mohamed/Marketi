import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/repos/categories_repo.dart';

@lazySingleton
class CategoriesUseCase {
  final CategoriesRepo _categoriesRepo;

  const CategoriesUseCase(this._categoriesRepo);

  Future<Either<Failure, List<CategoryEntity>>> call({int page = 1}) async {
    return await _categoriesRepo.getCategories(page: page);
  }
}
