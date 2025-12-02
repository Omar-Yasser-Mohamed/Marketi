import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_all_products_use_case.dart';

part 'all_product_state.dart';

@Injectable()
class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this.getAllProductsUseCase) : super(AllProductInitial());
  final GetAllProductsUseCase getAllProductsUseCase;

  void safeEmit(AllProductState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllProducts({int page = 1}) async {
    if (page == 1) {
      safeEmit(AllProductLoading());
    } else {
      safeEmit(AllProductPaginationLoading());
    }
    final result = await getAllProductsUseCase.call(params: page);
    
    if (isClosed) return;

    result.fold(
      (failure) {
        if (page == 1) {
          safeEmit(AllProductFailure(failure.errorMessage));
        } else {
          safeEmit(AllProductPaginationFailure(failure.errorMessage));
        }
      },
      (products) {
        safeEmit(AllProductSuccess(products));
      },
    );
  }
}
