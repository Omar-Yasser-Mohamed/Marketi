import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/all_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/brands_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/cach_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/categories_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_best_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/get_popular_products_use_case.dart';
import 'package:marketi/features/profile/domain/repos/profile_repo.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._authRepo,
    this._profileRepo,
    this._allProductsUseCase,
    this._brandsUseCase,
    this._categoriesUseCase,
    this._getPopularProductsUseCase,
    this._getBestProductsUseCase,
    this._cachProductsUseCase,
  ) : super(HomeInitial());

  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;
  final AllProductsUseCase _allProductsUseCase;
  final BrandsUseCase _brandsUseCase;
  final CategoriesUseCase _categoriesUseCase;
  final GetPopularProductsUseCase _getPopularProductsUseCase;
  final GetBestProductsUseCase _getBestProductsUseCase;
  final CachProductsUseCase _cachProductsUseCase;

  List<ProductEntity> allProducts = [];

  void safeEmit(HomeState state) {
    if (!isClosed) emit(state);
  }

  T? _extractOrEmitFailure<T>(Either<Failure, T> result) {
    return result.fold(
      (failure) {
        safeEmit(HomeFailure(failure));
        return null;
      },
      (data) => data,
    );
  }

  Future<void> loadHomeData() async {
    safeEmit(HomeLoading());

    final verifyTokenResult = await _authRepo.verifyToken();
    final verifyToken = _extractOrEmitFailure(verifyTokenResult);
    if (verifyToken == null) return;

    final user = _extractOrEmitFailure(await _profileRepo.getUserData());
    if (user == null) return;

    final results = await Future.wait([
      _allProductsUseCase.call(page: 1),
      _categoriesUseCase.call(),
      _brandsUseCase.call(),
      _getPopularProductsUseCase.call(page: 1),
      _getBestProductsUseCase.call(page: 1),
    ]);

    final products = _extractOrEmitFailure(
      results[0] as Either<Failure, List<ProductEntity>>,
    );
    if (products == null) return;

    final categories = _extractOrEmitFailure(
      results[1] as Either<Failure, List<CategoryEntity>>,
    );
    if (categories == null) return;

    final brands = _extractOrEmitFailure(
      results[2] as Either<Failure, List<BrandEntity>>,
    );
    if (brands == null) return;

    final popular = _extractOrEmitFailure(
      results[3] as Either<Failure, List<ProductEntity>>,
    );
    if (popular == null) return;

    final best = _extractOrEmitFailure(
      results[4] as Either<Failure, List<ProductEntity>>,
    );
    if (best == null) return;

    safeEmit(
      HomeSuccess(
        products: products,
        popularProducts: popular,
        bestProducts: best,
        categories: categories,
        brands: brands,
        user: user,
      ),
    );

    await cachProducts();
  }

  Future<void> cachProducts() async {
    await _cachProductsUseCase();
  }

}
