import 'package:injectable/injectable.dart';
import 'package:marketi/core/constants/api_constants.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/network/api_service.dart';
import 'package:marketi/core/token/token_service.dart';
import 'package:marketi/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService apiService;

  CartRemoteDataSourceImpl(this.apiService);
  
  @override
  Future<CartModel> addToCart({required String productId}) async {
    final response = await apiService.post(
      endPoint: ApiConstants.cartEndPoint,
      data: {
        'productId': productId,
      },
      headers: {
        'token': await getToken(),
      },
    );

    final data = response.data['data'];

    return CartModel.fromJson(data);
  }

  @override
  Future<CartModel> deleteFromCart({required String productId}) async {
    final response = await apiService.delete(
      endPoint: "${ApiConstants.cartEndPoint}/$productId",
      headers: {
        'token': await getToken(),
      },
    );

    final data = response.data['data'];

    return CartModel.fromJson(data);
  }

  @override
  Future<CartModel> removeFromCart({required String productId, required int numberOfItems}) async {
    final response = await apiService.put(
      endPoint: '${ApiConstants.cartEndPoint}/$productId',
      data: {
        'count': '$numberOfItems',
      },
      headers: {
        'token': await getToken(),
      },
    );

    final data = response.data['data'];

    return CartModel.fromJson(data);
  }

  @override
  Future<CartModel> getCart() async {
    final response = await apiService.get(
      endPoint: ApiConstants.cartEndPoint,
      headers: {
        'token': await getToken(),
      },
    );

    final data = response.data['data'];

    return CartModel.fromJson(data);
  }

  Future<String?> getToken() async {
    return await getIt<TokenService>().getToken();
  }
}
