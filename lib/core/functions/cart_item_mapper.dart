import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

CartItemEntity cartItemMapper({
  required CartItemModel model,
  required List<ProductEntity> allProducts,
}) {
  final orginalProduct = allProducts.firstWhere(
    (p) => p.id == model.productId,
  );

  return CartItemEntity(
    product: orginalProduct,
    count: model.count ?? 0,
    price: model.price ?? 0,
  );
}
