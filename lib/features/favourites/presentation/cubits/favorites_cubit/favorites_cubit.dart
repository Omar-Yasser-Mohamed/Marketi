import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/features/favourites/domain/repos/favorites_repo.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

part 'favorites_state.dart';

@Injectable()
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());
  final FavoritesRepo favoritesRepo;
  List<ProductEntity> favProducts = [];

  void safeEmit(FavoritesState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getFavoritesProducts() async {
    safeEmit(FavoritesLoading());

    final result = await favoritesRepo.getFavorites();

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(FavoritesFailure(failure.errorMessage));
      },
      (products) {
        favProducts = products;
        safeEmit(FavoritesSuccess(products));
      },
    );
  }

  Future<void> toggleFavorite({
    required String productId,
    required bool isCurrentlyFavorite,
  }) async {
    safeEmit(FavoritesToggleLoading(productId));

    final result = isCurrentlyFavorite
        ? await favoritesRepo.removeFromFavorites(productId: productId)
        : await favoritesRepo.addToFavorites(productId: productId);

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(FavoritesFailure(failure.errorMessage));
      },
      (products) {
        favProducts = products;
        safeEmit(FavoritesSuccess(products));
      },
    );
  }
}
