import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/best_products_gird_view_bloc_consumer.dart';

class BestProductsScreenBody extends StatelessWidget {
  const BestProductsScreenBody({super.key});

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
                title: 'Best Products',
              ),
              SizedBox(height: 16),
              CustomSearchTextField(),
              SizedBox(height: 6),
            ],
          ),
        ),

        Expanded(
          child: BestProductsGridViewBlocConsumer(),
        ),
      ],
    );
  }
}
