import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/enums/products_type.dart';
import 'package:marketi/features/home/domain/use_cases/all_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_best_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_popular_products_use_case.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({
    required AllProductsUseCase allProductsUseCase,
    required GetBestProductsUseCase getBestProductsUseCase,
    required GetPopularProductsUseCase getPopularProductsUseCase,
  }) : _allProductsUseCase = allProductsUseCase,
       _getBestProductsUseCase = getBestProductsUseCase,
       _getPopularProductsUseCase = getPopularProductsUseCase,
       super(ProductsState.initial());
  final AllProductsUseCase _allProductsUseCase;
  final GetBestProductsUseCase _getBestProductsUseCase;
  final GetPopularProductsUseCase _getPopularProductsUseCase;

  int _currentPage = 1;

  void safeEmit(ProductsState newState) {
    if (!isClosed) emit(newState);
  }

  Future<void> fetchData(ProductsType type) async {
    switch (type) {
      case ProductsType.all:
        await _getAllProducts();
      case ProductsType.best:
        await _getBestProducts();
      case ProductsType.popular:
        await _getPopularProducts();
    }
  }

  Future<void> loadMore(ProductsType type) async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    switch (type) {
      case ProductsType.all:
        await _loadMoreAllProducts();
      case ProductsType.best:
        await _loadMoreBestProducts();
      case ProductsType.popular:
        await _loadMorePopularProducts();
    }
  }

  /// Load all products
  Future<void> _getAllProducts() async {
    safeEmit(state.copyWith(isLoading: true, failure: null));
    final result = await _allProductsUseCase.call(page: _currentPage);
    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoading: false, failure: failure));
      },
      (products) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            hasReachedMax: products.isEmpty,
            products: products,
          ),
        );
      },
    );
  }

  Future<void> _getBestProducts() async {
    safeEmit(state.copyWith(isLoading: true, failure: null));
    final result = await _getBestProductsUseCase.call(page: _currentPage);
    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoading: false, failure: failure));
      },
      (products) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            hasReachedMax: products.isEmpty,
            products: products,
          ),
        );
      },
    );
  }

  Future<void> _getPopularProducts() async {
    safeEmit(state.copyWith(isLoading: true, failure: null));
    final result = await _getPopularProductsUseCase.call(page: _currentPage);
    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoading: false, failure: failure));
      },
      (products) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            hasReachedMax: products.isEmpty,
            products: products,
          ),
        );
      },
    );
  }

  /// Load more functions
  Future<void> _loadMoreAllProducts() async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    safeEmit(state.copyWith(isLoadingMore: true, failure: null));
    final result = await _allProductsUseCase.call(page: ++_currentPage);
    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoadingMore: false, failure: failure));
      },
      (products) {
        safeEmit(
          state.copyWith(
            isLoadingMore: false,
            hasReachedMax: products.isEmpty,
            products: List.of(state.products)..addAll(products),
          ),
        );
      },
    );
  }

  Future<void> _loadMoreBestProducts() async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    safeEmit(state.copyWith(isLoadingMore: true, failure: null));
    final result = await _getBestProductsUseCase.call(page: ++_currentPage);
    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoadingMore: false, failure: failure));
      },
      (products) {
        safeEmit(
          state.copyWith(
            isLoadingMore: false,
            hasReachedMax: products.isEmpty,
            products: List.of(state.products)..addAll(products),
          ),
        );
      },
    );
  }

  Future<void> _loadMorePopularProducts() async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    safeEmit(state.copyWith(isLoadingMore: true, failure: null));
    final result = await _getPopularProductsUseCase.call(page: ++_currentPage);
    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoadingMore: false, failure: failure));
      },
      (products) {
        safeEmit(
          state.copyWith(
            isLoadingMore: false,
            hasReachedMax: products.isEmpty,
            products: List.of(state.products)..addAll(products),
          ),
        );
      },
    );
  }
}
