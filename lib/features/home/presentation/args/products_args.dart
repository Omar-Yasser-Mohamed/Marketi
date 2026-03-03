import 'package:marketi/features/home/domain/entities/product_entity.dart';

class ProductsArgs {
  final String title;
  final List<ProductEntity> products;

  ProductsArgs({required this.title, required this.products});
}
