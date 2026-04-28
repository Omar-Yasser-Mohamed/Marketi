import 'package:marketi/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
  Future<void> removeProductFromCart(String productId);
  Future<void> addProductToCart(String productId);
  Future<void> updateProductFromCart(String productId, int quantity);
}

