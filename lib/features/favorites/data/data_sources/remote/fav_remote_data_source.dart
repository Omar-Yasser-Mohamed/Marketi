import 'package:marketi/features/home/data/models/product_model.dart';

abstract class FavRemoteDataSource {
  Future<List<ProductModel>> getFavProducts();
  Future<void> addFavProduct(String productId);
  Future<void> removeFavProduct(String productId);
}
