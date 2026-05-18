import 'package:marketi/features/home/domain/enums/products_type.dart';

class ProductsArgs {
  final String title;
  final ProductsType type;

  ProductsArgs({required this.title, required this.type});
}
