import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/functions/brands_mapper.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';

abstract class BrandsRemoteDataSource {
  Future<List<BrandEntity>> getBrands({int page = 1});
}

@LazySingleton(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  final ApiService _apiService;

  const BrandsRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<BrandEntity>> getBrands({int page = 1}) async {
    final response = await _apiService.get(
      endpoint: ApiConstants.allBrandsEndPoint,
      queryParameters: {
        "page": page,
      },
    );
    final brands = brandsMapper(response.data);

    return brands;
  }
}
