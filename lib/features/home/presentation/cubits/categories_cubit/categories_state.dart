part of 'categories_cubit.dart';

class CategoriesState {
  final List<CategoryEntity> categories;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final Failure? failure;

  CategoriesState({
    required this.categories,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.failure,
  });

  factory CategoriesState.initial() {
    return CategoriesState(
      categories: [],
      isLoading: false,
      isLoadingMore: false,
      hasReachedMax: false,
      failure: null,
    );
  }

  CategoriesState copyWith({
    List<CategoryEntity>? categories,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure ?? this.failure,
    );
  }
}
