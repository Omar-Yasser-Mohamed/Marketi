import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/data/data_source/remote/category_remote_data_source.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/repos/categories_repo.dart';

@LazySingleton(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  const CategoriesRepoImpl(this._categoryRemoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories({
    int page = 1,
  }) async {
    try {
      final data = await _categoryRemoteDataSource.getCategories(page: page);

      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
