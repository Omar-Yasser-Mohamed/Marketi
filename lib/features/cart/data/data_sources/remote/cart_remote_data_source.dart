import 'package:marketi/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<CartModel> addToCart({required String productId});
  Future<CartModel> removeFromCart({required String productId, required int numberOfItems});
  Future<CartModel> deleteFromCart({required String productId});
}
