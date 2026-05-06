part of 'fav_cubit.dart';

sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavActionLoading extends FavState {
  final String productId;
  FavActionLoading(this.productId);
}

final class FavSuccess extends FavState {
  final List<ProductEntity> products;
  FavSuccess(this.products);
}

final class FavFailure extends FavState {
  final Failure failure;
  FavFailure(this.failure);
}
