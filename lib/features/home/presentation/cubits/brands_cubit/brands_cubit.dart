import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/use_cases/brands_use_case.dart';

part 'brands_state.dart';

@injectable
class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit(this._brandsUseCase) : super(BrandsState.initial());
  final BrandsUseCase _brandsUseCase;

  int _currentPage = 1;

  void safeEmit(BrandsState newState) {
    if (!isClosed) emit(newState);
  }

  Future<void> getBrands() async {
    safeEmit(state.copyWith(isLoading: true, failure: null));

    final result = await _brandsUseCase.call(page: _currentPage);

    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoading: false, failure: failure));
      },
      (brands) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            hasReachedMax: brands.isEmpty,
            brands: brands,
          ),
        );
      },
    );
  }

  Future<void> loadMoreBrands() async {
    if (state.isLoadingMore || state.hasReachedMax) return;

    safeEmit(state.copyWith(isLoadingMore: true, failure: null));

    final result = await _brandsUseCase.call(page: ++_currentPage);

    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoadingMore: false, failure: failure));
      },
      (brands) {
        safeEmit(
          state.copyWith(
            isLoadingMore: false,
            hasReachedMax: brands.isEmpty,
            brands: List.of(state.brands)..addAll(brands),
          ),
        );
      },
    );
  }

  Future<void> refresh() async {
    _currentPage = 1;

    safeEmit(state.copyWith(isLoading: true, failure: null));

    await getBrands();
  }
}
