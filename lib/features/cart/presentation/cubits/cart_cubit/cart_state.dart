part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartActionLoading extends CartState {
  final String productId;
  CartActionLoading(this.productId);
}

final class CartSuccess extends CartState {
  final CartEntity cart;

  CartSuccess(this.cart);
}

final class CartFailure extends CartState {
  final Failure failure;

  CartFailure(this.failure);
}
