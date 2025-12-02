import 'package:flutter/material.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/category_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        childAspectRatio: 1.8 / 2.1,
      ),
      itemCount: categories.length > 6 ? 6 : categories.length,
      itemBuilder: (context, index) => CategoryItem(
        category: categories[index],
      ),
    );
  }
}
