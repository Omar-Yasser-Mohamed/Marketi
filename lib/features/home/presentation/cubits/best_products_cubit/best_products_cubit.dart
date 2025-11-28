import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_best_products_use_case.dart';

part 'best_products_state.dart';

@Injectable()
class BestProductsCubit extends Cubit<BestProductsState> {
  BestProductsCubit(this.getBestProductsUseCase) : super(BestProductsInitial());
  final GetBestProductsUseCase getBestProductsUseCase;

  Future<void> getBestProducts({int page = 1}) async {
    emit(BestProductsLoading());
    final result = await getBestProductsUseCase.call(params: page);
    result.fold(
      (failure) {
        emit(BestProductsFailure(failure.errorMessage));
      },
      (products) {
        emit(BestProductsSuccess(products));
      },
    );
  }
}
