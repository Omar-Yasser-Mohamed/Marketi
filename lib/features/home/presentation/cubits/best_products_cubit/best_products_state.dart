part of 'best_products_cubit.dart';

abstract class BestProductsState {}

final class BestProductsInitial extends BestProductsState {}

final class BestProductsLoading extends BestProductsState {}

final class BestProductsPaginationLoading extends BestProductsState {}

final class BestProductsSuccess extends BestProductsState {
  final List<ProductEntity> products;

  BestProductsSuccess(this.products);
}

final class BestProductsFailure extends BestProductsState {
  final String errorMsg;

  BestProductsFailure(this.errorMsg);
}

final class BestProductsPaginationFailure extends BestProductsState {
  final String errorMsg;
  
  BestProductsPaginationFailure(this.errorMsg);
}
