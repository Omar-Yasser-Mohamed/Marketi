part of 'brands_cubit.dart';

class BrandsState {
  final List<BrandEntity> brands;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final Failure? failure;

  BrandsState({
    required this.brands,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.failure,
  });

  factory BrandsState.initial() {
    return BrandsState(
      brands: [],
      isLoading: false,
      isLoadingMore: false,
      hasReachedMax: false,
      failure: null,
    );
  }

  BrandsState copyWith({
    List<BrandEntity>? brands,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return BrandsState(
      brands: brands ?? this.brands,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure ?? this.failure,
    );
  }
}
