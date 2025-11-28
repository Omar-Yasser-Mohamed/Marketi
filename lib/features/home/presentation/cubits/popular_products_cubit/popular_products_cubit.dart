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

  Future<void> getPopularProducts({int page = 1}) async {
    emit(PopularProductsLoading());
    final result = await getPopularProductUseCase.call(params: page);

    result.fold(
      (failure) {
        emit(PopularProductsFailure(failure.errorMessage));
      },
      (products) {
        emit(PopularProductsSuccess(products));
      },
    );
  }
}
