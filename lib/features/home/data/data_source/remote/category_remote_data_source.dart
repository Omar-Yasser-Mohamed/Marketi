import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/functions/categories_mapper.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> getCategories({int page = 1});
}

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiService _apiService;

  CategoryRemoteDataSourceImpl(this._apiService);
  @override
  Future<List<CategoryEntity>> getCategories({int page = 1}) async {
    final response = await _apiService.get(
      endpoint: ApiConstants.allCategoriesEndPoint,
      queryParameters: {
        "page": page,
      },
    );
    
    final List<CategoryEntity> categories = categoriesMapper(response.data);

    return categories;
  }
}
