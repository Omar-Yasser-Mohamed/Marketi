import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/search_products_use_case.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchProductsUseCase _searchProductsUseCase;
  SearchCubit(this._searchProductsUseCase) : super(SearchInitial());

  Timer? _debounceTimer;

  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      emit(SearchLoading());
      final result = await _searchProductsUseCase(query.trim());
      result.fold(
        (failure) => emit(SearchFailure(failure)),
        (products) => emit(SearchSuccess(products)),
      );
    });
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
