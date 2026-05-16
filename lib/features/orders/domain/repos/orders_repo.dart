import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getAllOrders();
}