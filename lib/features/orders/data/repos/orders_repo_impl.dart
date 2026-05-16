import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/error_handler.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/orders/data/data_sources/remote/orders_remote_data_source.dart';
import 'package:marketi/features/orders/data/mappers/order_mapper.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/domain/repos/orders_repo.dart';

@LazySingleton(as: OrdersRepo)
class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _ordersRemoteDataSource;

  OrdersRepoImpl(this._ordersRemoteDataSource);

  @override
  Future<Either<Failure, List<OrderEntity>>> getAllOrders() async {
    try {
      final orders = await _ordersRemoteDataSource.getAllOrders();
      return right(
        orders.map((e) => OrderMapper.mapToEntity(e)).toList(),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
