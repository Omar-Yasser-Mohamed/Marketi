import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

List<ProductEntity> productsMapper(Map<String, dynamic> data) {
  final List<ProductEntity> products = [];
  for (final product in data['data'] ?? []) {
    products.add(ProductModel.fromJson(product));
  }
  return products;
}
