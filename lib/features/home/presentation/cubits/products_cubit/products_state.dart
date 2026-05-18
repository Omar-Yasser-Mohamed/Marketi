part of 'products_cubit.dart';

class ProductsState {
  final List<ProductEntity> products;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final Failure? failure;

  const ProductsState({
    required this.products,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.failure,
  });

  factory ProductsState.initial() {
    return const ProductsState(
      products: [],
      isLoading: false,
      isLoadingMore: false,
      hasReachedMax: false,
      failure: null,
    );
  }

  ProductsState copyWith({
    List<ProductEntity>? products,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure ?? this.failure,
    );
  }
}

