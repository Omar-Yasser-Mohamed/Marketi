import 'package:marketi/features/cart/data/models/checkout_request.dart';

abstract class CheckoutRemoteDataSource {
  Future<void> createCashOrder(CheckoutRequest checkout);
  Future<String> createOnlineOrder(CheckoutRequest checkout);
}