import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/error/failure.dart';
import 'package:marketi/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';
import 'package:marketi/features/cart/domain/repos/cart_repo.dart';

@LazySingleton(as: CartRepo)
class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<Either<Failure, CartModel>> addToCart({
    required String productId,
  }) async {
    try {
      final cart = await cartRemoteDataSource.addToCart(productId: productId);

      return right(cart);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> deleteFromCart({
    required String productId,
  }) async {
    try {
      final cart = await cartRemoteDataSource.deleteFromCart(productId: productId);

      return right(cart);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> removeFromCart({
    required String productId,
    required int numberOfItems,
  }) async {
    try {
      final cart = await cartRemoteDataSource.removeFromCart(
        productId: productId,
        numberOfItems: numberOfItems,
      );

      return right(cart);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      final cart = await cartRemoteDataSource.getCart();

      return right(cart);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
