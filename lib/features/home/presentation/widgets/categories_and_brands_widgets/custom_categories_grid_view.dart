import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/category_item.dart';

class CustomCategoriesGridView extends StatelessWidget {
  const CustomCategoriesGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Text(
              'All Categories',
              style: TextStyles.enSb22.copyWith(
                color: ColorStyles.darkBlue900,
              ),
            ),
          ),

          GridView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 24,
              left: 14,
              right: 14,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 2 / 1.6,
            ),
            itemCount: 20,
            itemBuilder: (context, index) => CategoryItem(
              aspectRatio: 2 / 1.2,
              category: CategoryEntity(
                id: '',
                name: 'name',
                image: 'image',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
