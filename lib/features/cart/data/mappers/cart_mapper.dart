import 'package:marketi/features/cart/data/mappers/cart_item_mapper.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';

class CartMapper {
  static CartEntity mapToEntity(CartModel model) {
    return CartEntity(
      id: model.id ?? "",
      cartOwner: model.cartOwner ?? "",
      products: model.products?.map((e) => CartItemMapper.mapToEntity(e)).toList() ?? [],
      totalCartPrice: model.totalCartPrice?.toDouble() ?? 0,
    );
  }
}