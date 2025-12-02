import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/widgets/categories_and_brands_widgets/custom_brands_grid_view.dart';

class AllBrandsScreenBody extends StatelessWidget {
  const AllBrandsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14, right: 14, top: 58),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCenterAppBar(
                title: 'Brands',
              ),
              SizedBox(height: 16),
              CustomSearchTextField(),
              SizedBox(height: 6),
            ],
          ),
        ),

        Expanded(
          child: CustomBrandsGridView(),
        ),
      ],
    );
  }
}
