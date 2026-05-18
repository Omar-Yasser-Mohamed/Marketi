import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/api_constants.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/shared/token/token_service.dart';
import 'package:marketi/features/cart/data/data_sources/remote/checkout_remote_data_source.dart';
import 'package:marketi/features/cart/data/models/checkout_request.dart';

@LazySingleton(as: CheckoutRemoteDataSource)
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final ApiService apiService;
  final TokenService tokenService;

  CheckoutRemoteDataSourceImpl({
    required this.apiService,
    required this.tokenService,
  });

  @override
  Future<void> createCashOrder(CheckoutRequest checkout) async {
    await apiService.post(
      endpoint: "${ApiConstants.ordersEndPoint}/${checkout.cartId}",
      data: checkout.toJson(),
      headers: {
        'token': await tokenService.getToken(),
      },
    );
  }

  @override
  Future<String> createOnlineOrder(CheckoutRequest checkout) async {
    final response = await apiService.post(
      endpoint: "${ApiConstants.checkoutEndPoint}/${checkout.cartId}",
      data: checkout.toJson(),
      headers: {
        'token': await tokenService.getToken(),
      },
    );

    return response.data['session']['url'] as String;
  }
}
