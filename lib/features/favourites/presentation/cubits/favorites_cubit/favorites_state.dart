part of 'favorites_cubit.dart';

abstract class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesToggleLoading extends FavoritesState {
  final String productId;

  FavoritesToggleLoading(this.productId);
}

final class FavoritesSuccess extends FavoritesState {
  final List<ProductEntity> products;

  FavoritesSuccess(this.products);
}

final class FavoritesFailure extends FavoritesState {
  final String errorMsg;

  FavoritesFailure(this.errorMsg);
}
