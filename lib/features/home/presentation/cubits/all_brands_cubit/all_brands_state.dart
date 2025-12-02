part of 'all_brands_cubit.dart';

abstract class AllBrandsState {}

final class AllBrandsInitial extends AllBrandsState {}

final class AllBrandsLoading extends AllBrandsState {}

final class AllBrandsPaginationLoading extends AllBrandsState {}

final class AllBrandsSuccess extends AllBrandsState {
  final List<BrandEntity> brands;

  AllBrandsSuccess(this.brands);
}

final class AllBrandsFailure extends AllBrandsState {
  final String errorMsg;

  AllBrandsFailure(this.errorMsg);
}

final class AllBrandsPaginationFailure extends AllBrandsState {
  final String errorMsg;

  AllBrandsPaginationFailure(this.errorMsg);
}
