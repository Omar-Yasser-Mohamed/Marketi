import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/functions/cart_mapper.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/domain/repos/cart_repo.dart';
import 'package:marketi/features/home/presentation/cubits/all_products_cubit/all_product_cubit.dart';

part 'cart_state.dart';

@Injectable()
class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo, this.allProductCubit) : super(CartInitial());
  final CartRepo cartRepo;
  final AllProductsCubit allProductCubit;

  CartEntity userCart = CartEntity(
    id: 'id',
    products: [],
    numberOfItems: 0,
    totalPrice: 0,
  );

  void safeEmit(CartState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getCart() async {
    safeEmit(CartLoading());
    if (AllProductsCubit.allProducts.isEmpty) {
      await allProductCubit.getAllProducts();
    }

    final result = await cartRepo.getCart();

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(CartFailure(failure.errorMessage));
      },
      (cartModel) {
        final cart = cartMapper(
          cartModel: cartModel,
          allProducts: AllProductsCubit.allProducts,
        );
        userCart = cart;
        safeEmit(CartSuccess(cart));
      },
    );
  }

  Future<void> addToCart({required String productId}) async {
    safeEmit(CartEditingLoading(productId: productId));
    final result = await cartRepo.addToCart(productId: productId);

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(CartFailure(failure.errorMessage));
      },
      (cartModel) {
        final cart = cartMapper(
          cartModel: cartModel,
          allProducts: AllProductsCubit.allProducts,
        );
        userCart = cart;
        safeEmit(CartSuccess(cart));
      },
    );
  }

  Future<void> deleteFromCart({required String productId}) async {
    safeEmit(CartEditingLoading(productId: productId));
    final result = await cartRepo.deleteFromCart(productId: productId);

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(CartFailure(failure.errorMessage));
      },
      (cartModel) {
        final cart = cartMapper(
          cartModel: cartModel,
          allProducts: AllProductsCubit.allProducts,
        );
        userCart = cart;
        safeEmit(CartSuccess(cart));
      },
    );
  }

  Future<void> removeFromCart({
    required String productId,
    required int numberOfItems,
  }) async {
    safeEmit(CartEditingLoading(productId: productId));

    final result = await cartRepo.removeFromCart(
      productId: productId,
      numberOfItems: numberOfItems,
    );

    if (isClosed) return;

    result.fold(
      (failure) {
        safeEmit(CartFailure(failure.errorMessage));
      },
      (cartModel) {
        final cart = cartMapper(
          cartModel: cartModel,
          allProducts: AllProductsCubit.allProducts,
        );
        userCart = cart;
        safeEmit(CartSuccess(cart));
      },
    );
  }
}

// Create states to edit Add, remove & delete buttons in HorizontalProductItem
