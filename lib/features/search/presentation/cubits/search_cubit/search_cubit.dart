import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/presentation/cubits/all_products_cubit/all_product_cubit.dart';

part 'search_state.dart';

@Injectable()
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.allProductCubit) : super(SearchInitial());
  final AllProductsCubit allProductCubit;

  List<ProductEntity> allProducts = [];

  void safeEmit(SearchState state) {
    if (!isClosed) emit(state);
  }

  Future<void> init() async {
    safeEmit(SearchLoading());
    if (AllProductsCubit.allProducts.isEmpty) {
      await allProductCubit.getAllProducts();
    }
    allProducts = AllProductsCubit.allProducts;
    safeEmit(SearchInitial());
  }

  void search({required String query}) {
    List<ProductEntity> products = [];
    safeEmit(SearchLoading());

    if (query.trim().isEmpty) {
      safeEmit(SearchInitial());
      return;
    }

    if (isClosed) return;

    products = AllProductsCubit.allProducts
        .where(
          (p) => p.name.toLowerCase().contains(query.toLowerCase().trim()),
        )
        .toList();
    safeEmit(SearchSuccess(products));
  }
}
