import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/use_cases/categories_use_case.dart';

part 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesUseCase) : super(CategoriesState.initial());
  final CategoriesUseCase _categoriesUseCase;

  int _currentPage = 1;

  void safeEmit(CategoriesState newState) {
    if (!isClosed) emit(newState);
  }

  Future<void> getAllCategories() async {
    safeEmit(state.copyWith(isLoading: true, failure: null));

    final result = await _categoriesUseCase.call(page: _currentPage);

    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoading: false, failure: failure));
      },
      (categories) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            hasReachedMax: categories.isEmpty,
            categories: categories,
          ),
        );
      },
    );
  }

  Future<void> loadMoreCategories() async {
    if (state.isLoadingMore || state.hasReachedMax) return;

    safeEmit(state.copyWith(isLoadingMore: true, failure: null));

    final result = await _categoriesUseCase.call(page: ++_currentPage);

    result.fold(
      (failure) {
        safeEmit(state.copyWith(isLoadingMore: false, failure: failure));
      },
      (categories) {
        safeEmit(
          state.copyWith(
            isLoadingMore: false,
            hasReachedMax: categories.isEmpty,
            categories: List.of(state.categories)..addAll(categories),
          ),
        );
      },
    );
  }

  Future<void> refresh() async {
    _currentPage = 1;

    safeEmit(state.copyWith(isLoading: true, failure: null));

    await getAllCategories();
  }
}
