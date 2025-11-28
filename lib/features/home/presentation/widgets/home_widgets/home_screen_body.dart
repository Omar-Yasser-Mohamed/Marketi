import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/best_products_for_you_list_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/brands_list.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/buy_products_again_list_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/categories_grid_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/popular_products_list_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/custom_title.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/home_header_section.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/offers_slider.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 58),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: HomeHeaderSection(),
        ),

        const SizedBox(height: 14),

        const OffersSlider(),

        const SizedBox(height: 14),
        CustomTitle(
          title: 'Popular Product',
          onPressed: () {},
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .18,
          child: const PopularProductsListView(),
        ),

        const SizedBox(height: 14),

        CustomTitle(
          title: 'Category',
          onPressed: () {},
        ),
        const SizedBox(height: 8),

        SizedBox(
          height: height * .3,
          child: const CategoriesGridView(),
        ),

        const SizedBox(height: 14),

        CustomTitle(
          title: 'Best for You',
          onPressed: () {},
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .22,
          child: const BestProductsForYouListView(),
        ),

        const SizedBox(height: 22),

        CustomTitle(
          title: 'Brands',
          onPressed: () {},
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .125,
          child: const BrandsList(),
        ),

        const SizedBox(height: 14),

        CustomTitle(
          title: 'Buy Again',
          onPressed: () {},
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .22,
          child: const BuyProductsAgainListView(),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
