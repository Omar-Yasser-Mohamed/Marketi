import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:marketi/features/cart/data/mappers/cart_mapper.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/domain/repos/cart_repo.dart';

@LazySingleton(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartRepoImpl(this._cartRemoteDataSource);
  final CartRemoteDataSource _cartRemoteDataSource;

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final cartModel = await _cartRemoteDataSource.getCart();
      log(cartModel.products?.length.toString() ?? "no products");
      return Right(CartMapper.mapToEntity(cartModel));
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}