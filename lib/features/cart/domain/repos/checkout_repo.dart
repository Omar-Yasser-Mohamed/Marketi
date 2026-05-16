import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/data/models/checkout_request.dart';

abstract interface class CheckoutRepo {
  Future<Either<Failure, void>> createCashOrder(CheckoutRequest checkout);
  Future<Either<Failure, void>> createOnlineOrder(CheckoutRequest checkout);
}