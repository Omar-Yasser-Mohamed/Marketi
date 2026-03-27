import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/shared/entities/user_entity.dart';
import 'package:marketi/features/auth/domain/repos/auth_repo.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/enums/sort_type.dart';
import 'package:marketi/features/home/domain/use_cases/all_products_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/brands_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/categories_use_case.dart';
import 'package:marketi/features/home/domain/use_cases/sort_products_use_case.dart';
import 'package:marketi/features/profile/domain/repos/profile_repo.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._authRepo,
    this._profileRepo,
    this._allProductsUseCase,
    this._sortProductsUseCase,
    this._brandsUseCase,
    this._categoriesUseCase,
  ) : super(HomeInitial());

  final AuthRepo _authRepo;
  final ProfileRepo _profileRepo;
  final AllProductsUseCase _allProductsUseCase;
  final SortProductsUseCase _sortProductsUseCase;
  final BrandsUseCase _brandsUseCase;
  final CategoriesUseCase _categoriesUseCase;

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
      _allProductsUseCase.call(),
      _categoriesUseCase.call(),
      _brandsUseCase.call(),
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
        user: user,
      ),
    );
  }
}
