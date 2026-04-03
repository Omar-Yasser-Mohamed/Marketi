import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, CartEntity>> getCart();
}
