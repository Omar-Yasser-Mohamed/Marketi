import 'package:marketi/core/functions/cart_item_mapper.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

CartEntity cartMapper({
  required CartModel cartModel,
  required List<ProductEntity> allProducts,
}) {
  final products = cartModel.cartProducts!
      .map(
        (item) => cartItemMapper(model: item, allProducts: allProducts),
      )
      .toList();

  return CartEntity(
    id: cartModel.cartId ?? '',
    products: products,
    numberOfItems: cartModel.v ?? 0,
    totalPrice: cartModel.totalCartPrice ?? 0,
  );
}
