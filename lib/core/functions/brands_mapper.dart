import 'package:marketi/features/home/data/models/brand_model.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';

List<BrandEntity> brandsMapper(Map<String, dynamic> data) {
  final List<BrandEntity> brands = [];
  for (final brand in data['data'] ?? []) {
    brands.add(BrandModel.fromJson(brand));
  }
  return brands;
}
