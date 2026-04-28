import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> addProductToCart(String productId);
  Future<Either<Failure, CartEntity>> removeProductFromCart(String productId);
  Future<Either<Failure, CartEntity>> updateProductFromCart(String productId, int quantity);
}
