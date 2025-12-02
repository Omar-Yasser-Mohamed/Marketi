part of 'all_product_cubit.dart';

abstract class AllProductState {}

final class AllProductInitial extends AllProductState {}

final class AllProductLoading extends AllProductState {}

final class AllProductPaginationLoading extends AllProductState {}

final class AllProductSuccess extends AllProductState {
  final List<ProductEntity> products;

  AllProductSuccess(this.products);
}

final class AllProductFailure extends AllProductState {
  final String errorMsg;

  AllProductFailure(this.errorMsg);
}

final class AllProductPaginationFailure extends AllProductState {
  final String errorMsg;

  AllProductPaginationFailure(this.errorMsg);
}
