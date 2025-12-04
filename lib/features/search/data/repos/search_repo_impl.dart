import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/search/domain/repos/search_repo.dart';

@LazySingleton(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  SearchRepoImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final List<ProductEntity> allProducts = [];
      for (var page = 1; ; page++) {
        final data = await homeRemoteDataSource.getAllProducts(page: page);
        if (data.isEmpty) break;
        allProducts.addAll(data);
      }

      return right(allProducts);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
