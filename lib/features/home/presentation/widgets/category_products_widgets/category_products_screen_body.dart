import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/category_products_widgets/category_products_bloc_builder.dart';
import '../search_button.dart';

class CategoryProductsScreenBody extends StatelessWidget {
  const CategoryProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 14,
            right: 14,
            top: 8,
            bottom: 8,
          ),
          child: SearchButton(),
        ),

        Expanded(child: CategoryProductsBlocBuilder()),
      ],
    );
  }
}
