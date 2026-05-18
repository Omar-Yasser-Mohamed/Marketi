import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/data/data_sources/remote/checkout_remote_data_source.dart';
import 'package:marketi/features/cart/data/models/checkout_request.dart';
import 'package:marketi/features/cart/domain/repos/checkout_repo.dart';

@LazySingleton(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;

  CheckoutRepoImpl({required this.checkoutRemoteDataSource});

  @override
  Future<Either<Failure, void>> createCashOrder(
    CheckoutRequest checkout,
  ) async {
    try {
      await checkoutRemoteDataSource.createCashOrder(checkout);
      return right(null);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, String>> createOnlineOrder(
    CheckoutRequest checkout,
  ) async {
    try {
      final url = await checkoutRemoteDataSource.createOnlineOrder(checkout);
      return right(url);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
