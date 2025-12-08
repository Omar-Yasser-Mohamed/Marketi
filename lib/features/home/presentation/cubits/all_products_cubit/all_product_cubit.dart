import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/use_case/use_case.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_all_products_use_case.dart';

part 'all_product_state.dart';

@Injectable()
class AllProductsCubit extends Cubit<AllProductState> {
  AllProductsCubit(this.getAllProductsUseCase) : super(AllProductInitial());
  final GetAllProductsUseCase getAllProductsUseCase;

  static List<ProductEntity> allProducts = [] ;

  void safeEmit(AllProductState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllProducts() async {
    safeEmit(AllProductLoading());
    final result = await getAllProductsUseCase.call(params: NoParam());

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(AllProductFailure(failure.errorMessage));
      },
      (products) {
        allProducts = products;
        safeEmit(AllProductSuccess(allProducts));
      },
    );
  }
}
