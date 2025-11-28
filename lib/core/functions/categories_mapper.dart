import 'package:marketi/features/home/data/models/category_model.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';

List<CategoryEntity> categoriesMapper(Map<String, dynamic> data) {
  final List<CategoryEntity> categories = [];
  for (final category in data['data'] ?? []) {
    categories.add(CategoryModel.fromJson(category));
  }
  return categories;
}
