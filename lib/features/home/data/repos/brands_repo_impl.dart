import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/data/data_source/remote/brands_remote_data_source.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/repos/brands_repo.dart';

@LazySingleton(as: BrandsRepo)
class BrandsRepoImpl implements BrandsRepo {
  final BrandsRemoteDataSource _dataSource;

  const BrandsRepoImpl(this._dataSource);
  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands({int page = 1}) async {
    try {
      final data = await _dataSource.getBrands(page: page);

      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
