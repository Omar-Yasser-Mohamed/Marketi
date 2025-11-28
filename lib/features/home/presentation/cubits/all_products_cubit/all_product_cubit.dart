import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/domain/use_cases/get_all_products_use_case.dart';

part 'all_product_state.dart';

@Injectable()
class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this.getAllProductsUseCase) : super(AllProductInitial());
  final GetAllProductsUseCase getAllProductsUseCase;

  Future<void> getAllProducts({int page = 1}) async {
    emit(AllProductLoading());
    final result = await getAllProductsUseCase.call(params: page);
    result.fold(
      (failure) {
        emit(AllProductFailure(failure.errorMessage));
      },
      (products) {
        emit(AllProductSuccess(products));
      },
    );
  }
}
