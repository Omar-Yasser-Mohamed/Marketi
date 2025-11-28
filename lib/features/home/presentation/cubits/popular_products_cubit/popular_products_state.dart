part of 'popular_products_cubit.dart';

abstract class PopularProductsState {}

final class PopularProductsInitial extends PopularProductsState {}

final class PopularProductsLoading extends PopularProductsState {}

final class PopularProductsSuccess extends PopularProductsState {
  final List<ProductEntity> products;

  PopularProductsSuccess(this.products);
}

final class PopularProductsFailure extends PopularProductsState {
  final String errorMsg;

  PopularProductsFailure(this.errorMsg);
}
