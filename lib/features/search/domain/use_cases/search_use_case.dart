import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/search/domain/repos/search_repo.dart';

@lazySingleton
class SearchUseCase implements UseCase<List<ProductEntity>, NoParam> {
  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call({
    required NoParam params,
  }) async {
    return await searchRepo.getAllProducts();
  }
}
