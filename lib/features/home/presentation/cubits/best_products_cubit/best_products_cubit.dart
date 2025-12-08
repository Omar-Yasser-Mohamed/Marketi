import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_best_products_use_case.dart';

part 'best_products_state.dart';

@Injectable()
class BestProductsCubit extends Cubit<BestProductsState> {
  BestProductsCubit(this.getBestProductsUseCase) : super(BestProductsInitial());
  final GetBestProductsUseCase getBestProductsUseCase;

  void safeEmit(BestProductsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getBestProducts({int page = 1}) async {
    if (page == 1) {
      safeEmit(BestProductsLoading());
    } else {
      safeEmit(BestProductsPaginationLoading());
    }
    final result = await getBestProductsUseCase.call(params: page);

    if (isClosed) return;

    result.fold(
      (failure) {
        if (page == 1) {
          safeEmit(BestProductsFailure(failure.errorMessage));
        } else {
          safeEmit(BestProductsPaginationFailure(failure.errorMessage));
        }
      },
      (products) {
        safeEmit(BestProductsSuccess(products));
      },
    );
  }
}
