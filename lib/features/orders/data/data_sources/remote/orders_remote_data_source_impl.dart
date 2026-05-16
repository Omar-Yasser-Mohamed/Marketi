import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/token/token_service.dart';
import 'package:marketi/features/orders/data/data_sources/remote/orders_remote_data_source.dart';
import 'package:marketi/features/orders/data/models/order_model.dart';

@LazySingleton(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiService _apiService;
  final TokenService _tokenService;

  OrdersRemoteDataSourceImpl(this._apiService, this._tokenService);

  @override
  Future<List<OrderModel>> getAllOrders() async {
    final userId = await _tokenService.getUserId();
    final response = await _apiService.get(
        endpoint: "${ApiConstants.userOrdersEndPoint}/$userId");

    final List<dynamic> data = response.data;
    return data.map((e) => OrderModel.fromJson(e)).toList();
  }
}
