import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/popular_products_grid_view_bloc_consumer.dart';

class PopularProductsScreenBody extends StatelessWidget {
  const PopularProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 56),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomCenterAppBar(
                title: 'Popular Products',
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Routes.searchScreen);
                },
                child: const CustomSearchTextField(
                  enabled: false,
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),

        const Expanded(child: PopularProductsGridViewBlocConsumer()),
      ],
    );
  }
}
