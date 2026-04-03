import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/domain/repos/cart_repo.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());
  final CartRepo _cartRepo;

  void safeEmit(CartState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getCart() async {
    safeEmit(CartLoading());
    final result = await _cartRepo.getCart();
    result.fold(
      (failure) => safeEmit(CartFailure(failure)),
      (cart) => safeEmit(CartSuccess(cart)),
    );
  }
}
