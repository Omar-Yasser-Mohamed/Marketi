import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

@LazySingleton()
class GetAllCategoriesUseCase
    implements UseCase<List<CategoryEntity>, NoParam> {
  final HomeRepo homeRepo;

  GetAllCategoriesUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<CategoryEntity>>> call({
    required NoParam params,
  }) async {
    return await homeRepo.getAllCategories();
  }
}
