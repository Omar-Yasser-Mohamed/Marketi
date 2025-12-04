import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/search/domain/use_cases/search_use_case.dart';

part 'search_state.dart';

@Injectable()
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchUseCase) : super(SearchInitial());
  final SearchUseCase _searchUseCase;

  List<ProductEntity> allProducts = [];

  void safeEmit(SearchState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllProducts() async {
    final result = await _searchUseCase.call(params: NoParam());

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(SearchFailure(failure.errorMessage));
      },
      (products) {
        allProducts = products;
      },
    );
  }

  void search({required String query}) {
    List<ProductEntity> products;

    if (query.trim().isEmpty) {
      products = [];
      safeEmit(SearchInitial());
      return;
    }

    safeEmit(SearchLoading());

    if (isClosed) return;

    products = allProducts
        .where(
          (p) => p.name.toLowerCase().contains(query.toLowerCase().trim()),
        )
        .toList();
    safeEmit(SearchSuccess(products));
  }
}
