part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductEntity> products;
  final List<ProductEntity> popularProducts;
  final List<ProductEntity> bestProducts;
  final List<CategoryEntity> categories;
  final List<BrandEntity> brands;
  final UserEntity user;

  HomeSuccess({
    required this.products,
    required this.popularProducts,
    required this.bestProducts,
    required this.categories,
    required this.brands,
    required this.user,
  });
}

final class HomeFailure extends HomeState {
  final Failure failure;

  HomeFailure(this.failure);
}
