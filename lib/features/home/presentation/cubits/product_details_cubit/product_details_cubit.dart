import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/repos/products_repo.dart';

part 'product_details_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productsRepo) : super(ProductDetailsInitial());
  final ProductsRepo _productsRepo;

  void safeEmit(ProductDetailsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getProductById(String id) async {
    safeEmit(ProductDetailsLoading());
    final result = await _productsRepo.getProductById(id);
    result.fold(
      (failure) => safeEmit(ProductDetailsFailure(failure)),
      (product) => safeEmit(ProductDetailsSuccess(product)),
    );
  }
}
