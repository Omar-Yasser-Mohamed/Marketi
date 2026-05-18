import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/enums/products_type.dart';
import 'package:marketi/features/home/domain/use_cases/all_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_best_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_popular_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_products_by_brand_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_products_by_category_use_case.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({
    required AllProductsUseCase allProductsUseCase,
    required GetBestProductsUseCase getBestProductsUseCase,
    required GetPopularProductsUseCase getPopularProductsUseCase,
    required GetProductsByBrandUseCase getProductsByBrandUseCase,
    required GetProductsByCategoryUseCase getProductsByCategoryUseCase,
  }) : _allProductsUseCase = allProductsUseCase,
       _getBestProductsUseCase = getBestProductsUseCase,
       _getPopularProductsUseCase = getPopularProductsUseCase,
       _getProductsByBrandUseCase = getProductsByBrandUseCase,
       _getProductsByCategoryUseCase = getProductsByCategoryUseCase,
       super(ProductsState.initial());
  final AllProductsUseCase _allProductsUseCase;
  final GetBestProductsUseCase _getBestProductsUseCase;
  final GetPopularProductsUseCase _getPopularProductsUseCase;
  final GetProductsByBrandUseCase _getProductsByBrandUseCase;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;

  int _currentPage = 1;

  void safeEmit(ProductsState newState) {
    if (!isClosed) emit(newState);
  }

  Future<void> fetchData({
    required ProductsType type,
    String? brandId,
    String? categoryId,
  }) async {
    switch (type) {
      case ProductsType.all:
        await _getAllProducts();
        break;
      case ProductsType.best:
        await _getBestProducts();
        break;
      case ProductsType.popular:
        await _getPopularProducts();
        break;
      case ProductsType.brand:
        await _getProductsByBrand(brandId: brandId!);
        break;
      case ProductsType.category:
        await _getProductsByCategory(categoryId: categoryId!);
        break;
    }
  }

  Future<void> loadMore({
    required ProductsType type,
    String? brandId,
    String? categoryId,
  }) async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    switch (type) {
      case ProductsType.all:
        await _loadMoreAllProducts();
        break;
      case ProductsType.best:
        await _loadMoreBestProducts();
        break;
      case ProductsType.popular:
        await _loadMorePopularProducts();
        break;
      case ProductsType.brand:
        await _loadMoreProductsByBrand(brandId: brandId!);
        break;
      case ProductsType.category:
        await _loadMoreProductsByCategory(categoryId: categoryId!);
        break;
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

  Future<void> _getProductsByBrand({required String brandId}) async {
    safeEmit(state.copyWith(isLoading: true, failure: null));
    final result = await _getProductsByBrandUseCase.call(
      page: _currentPage,
      brandId: brandId,
    );
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

  Future<void> _getProductsByCategory({required String categoryId}) async {
    safeEmit(state.copyWith(isLoading: true, failure: null));
    final result = await _getProductsByCategoryUseCase.call(
      page: _currentPage,
      categoryId: categoryId,
    );
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

  Future<void> _loadMoreProductsByBrand({required String brandId}) async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    safeEmit(state.copyWith(isLoadingMore: true, failure: null));
    final result = await _getProductsByBrandUseCase.call(
      page: ++_currentPage,
      brandId: brandId,
    );
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

  Future<void> _loadMoreProductsByCategory({required String categoryId}) async {
    if (state.isLoadingMore || state.hasReachedMax) return;
    safeEmit(state.copyWith(isLoadingMore: true, failure: null));
    final result = await _getProductsByCategoryUseCase.call(
      page: ++_currentPage,
      categoryId: categoryId,
    );
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
