import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/favorites/domain/repos/fav_repo.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

part 'fav_state.dart';

@injectable
class FavCubit extends Cubit<FavState> {
  FavCubit(this._favRepo) : super(FavInitial());
  final FavRepo _favRepo;

  List<ProductEntity> _products = [];
  List<ProductEntity> get products => _products;

  bool isFav(String productId) => _products.any((e) => e.id == productId);

  void safeEmit(FavState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getFavProducts() async {
    safeEmit(FavLoading());
    final result = await _favRepo.getFavProducts();
    result.fold(
      (failure) => safeEmit(FavFailure(failure)),
      (products) {
        _products = products;
        safeEmit(FavSuccess(products));
      },
    );
  }

  Future<void> addFavProduct(String productId) async {
    safeEmit(FavActionLoading(productId));
    final result = await _favRepo.addFavProduct(productId);
    result.fold(
      (failure) => safeEmit(FavFailure(failure)),
      (products) {
        _products = products;
        safeEmit(FavSuccess(products));
      },
    );
  }

  Future<void> removeFavProduct(String productId) async {
    safeEmit(FavActionLoading(productId));
    final result = await _favRepo.removeFavProduct(productId);
    result.fold(
      (failure) => safeEmit(FavFailure(failure)),
      (products) {
        _products = products;
        safeEmit(FavSuccess(products));
      },
    );
  }
}
