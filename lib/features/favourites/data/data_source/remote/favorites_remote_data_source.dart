import 'package:marketi/features/home/domain/entites/product_entity.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<ProductEntity>> getFavorites();
  Future<List<ProductEntity>> addToFavorites({required String productId});
  Future<List<ProductEntity>> removeFromFavorites({required String productId});
}
