import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/errors/failure_code.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/enums/sort_type.dart';
import 'package:marketi/features/home/domain/use_cases/all_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/brands_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/categories_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/sort_products_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._allProductsUseCase,
    this._sortProductsUseCase,
    this._brandsUseCase,
    this._categoriesUseCase,
  ) : super(HomeInitial());
  final AllProductsUseCase _allProductsUseCase;
  final SortProductsUseCase _sortProductsUseCase;
  final BrandsUseCase _brandsUseCase;
  final CategoriesUseCase _categoriesUseCase;

  List<ProductEntity> allProducts = [];

  void safeEmit(HomeState state) {
    if (!isClosed) emit(state);
  }

  Future<void> loadHomeData() async {
    safeEmit(HomeLoading());

    final results = await Future.wait([
      _allProductsUseCase.call(),
      _categoriesUseCase.call(),
      _brandsUseCase.call(),
    ]);

    final productsResult = results[0] as Either<Failure, List<ProductEntity>>;
    final categoriesResult =
        results[1] as Either<Failure, List<CategoryEntity>>;
    final brandsResult = results[2] as Either<Failure, List<BrandEntity>>;

    if (productsResult.isLeft()) {
      safeEmit(
        HomeFailure(
          productsResult.swap().getOrElse(
            () => const AppFailure(failureCode: FailureCode.unknown),
          ),
        ),
      );
      return;
    }

    if (categoriesResult.isLeft()) {
      safeEmit(
        HomeFailure(
          categoriesResult.swap().getOrElse(
            () => const AppFailure(failureCode: FailureCode.unknown),
          ),
        ),
      );
      return;
    }

    if (brandsResult.isLeft()) {
      safeEmit(
        HomeFailure(
          brandsResult.swap().getOrElse(
            () => const AppFailure(failureCode: FailureCode.unknown),
          ),
        ),
      );
      return;
    }

    final products = productsResult.getOrElse(() => []);
    final categories = categoriesResult.getOrElse(() => []);
    final brands = brandsResult.getOrElse(() => []);

    final popular = _sortProductsUseCase(
      allProducts: products,
      sortType: SortType.sold,
    );

    final best = _sortProductsUseCase(
      allProducts: products,
      sortType: SortType.ratingHighToLow,
    );

    safeEmit(
      HomeSuccess(
        products: products,
        popularProducts: popular,
        bestProducts: best,
        categories: categories,
        brands: brands,
      ),
    );
  }
}
