part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

class CartEditingLoading extends CartState {
  final String productId;

  CartEditingLoading({required this.productId});
}


final class CartSuccess extends CartState {
  final CartEntity cart;

  CartSuccess(this.cart);
}

final class CartFailure extends CartState {
  final String errorMsg;

  CartFailure(this.errorMsg);
}
