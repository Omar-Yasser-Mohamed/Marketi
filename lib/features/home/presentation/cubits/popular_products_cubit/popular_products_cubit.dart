import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_popular_product_use_case.dart';

part 'popular_products_state.dart';

@Injectable()
class PopularProductsCubit extends Cubit<PopularProductsState> {
  PopularProductsCubit(this.getPopularProductUseCase)
    : super(PopularProductsInitial());
  final GetPopularProductUseCase getPopularProductUseCase;

  void safeEmit(PopularProductsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getPopularProducts({int page = 1}) async {
    if (page == 1) {
      safeEmit(PopularProductsLoading());
    } else {
      safeEmit(PopularProductsPagiantionLoading());
    }
    final result = await getPopularProductUseCase.call(params: page);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (page == 1) {
          safeEmit(PopularProductsFailure(failure.errorMessage));
        } else {
          safeEmit(PopularProductsPaginatonFailure(failure.errorMessage));
        }
      },
      (products) {
        safeEmit(PopularProductsSuccess(products));
      },
    );
  }
}
