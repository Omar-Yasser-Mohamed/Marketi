import 'package:marketi/features/orders/data/models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getAllOrders();
}
