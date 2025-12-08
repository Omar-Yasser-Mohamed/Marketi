import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/all_products_grid_view_bloc_builder.dart';

class AllProductsScreenBody extends StatelessWidget {
  const AllProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 58),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomCenterAppBar(
                title: 'All Products',
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Routes.searchScreen);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: CustomSearchTextField(
                    enabled: false,
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),

        const Expanded(
          child: AllProductsGridViewBlocBuilder(),
        ),
      ],
    );
  }
}
