import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel>> getCart();
  Future<Either<Failure, CartModel>> addToCart({required String productId});
  Future<Either<Failure, CartModel>> deleteFromCart({required String productId});
  Future<Either<Failure, CartModel>> removeFromCart({required String productId, required int numberOfItems});
}
