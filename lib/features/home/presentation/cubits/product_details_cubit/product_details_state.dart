part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductEntity product;

  ProductDetailsSuccess(this.product);
}

final class ProductDetailsFailure extends ProductDetailsState {
  final Failure failure;

  ProductDetailsFailure(this.failure);
}
