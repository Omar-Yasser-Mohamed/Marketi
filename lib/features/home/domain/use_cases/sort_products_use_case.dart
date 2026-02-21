import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/enums/sort_type.dart';

@lazySingleton
class SortProductsUseCase {
  List<ProductEntity> call({
    required List<ProductEntity> allProducts,
    required SortType sortType,
  }) {
    final sortedProducts = List<ProductEntity>.from(allProducts);
    switch (sortType) {
      case SortType.ratingLowToHigh:
        sortedProducts.sort(
          (a, b) => a.avgRating.compareTo(b.avgRating),
        );
        return sortedProducts;
      case SortType.ratingHighToLow:
        sortedProducts.sort(
          (a, b) => b.avgRating.compareTo(a.avgRating),
        );
        return sortedProducts;
      case SortType.priceLowToHigh:
        sortedProducts.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        return sortedProducts;
      case SortType.priceHighToLow:
        sortedProducts.sort(
          (a, b) => b.price.compareTo(a.price),
        );
        return sortedProducts;
      case SortType.sold:
        sortedProducts.sort(
          (a, b) => b.sold.compareTo(a.sold),
        );
        return sortedProducts;
    }
  }
}
