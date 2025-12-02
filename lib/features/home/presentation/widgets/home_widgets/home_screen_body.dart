import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/all_products_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/best_products_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/brands_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/categories_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/popular_products_bloc_builder.dart';
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
          onPressed: () {
            GoRouter.of(context).push(Routes.popularProductsScreen);
          },
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .18,
          child: const PopularProductsBlocBuilder(),
        ),

        const SizedBox(height: 14),

        CustomTitle(
          title: 'Category',
          onPressed: () {
            GoRouter.of(context).push(Routes.allCategoriesScreen);
          },
        ),
        const SizedBox(height: 8),

        SizedBox(
          height: height * .3,
          child: const CategoriesBlocBuilder(),
        ),

        const SizedBox(height: 14),

        CustomTitle(
          title: 'Best for You',
          onPressed: () {
            GoRouter.of(context).push(Routes.bestProductsScreen);
          },
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .22,
          child: const BestProductsBlocBuilder(),
        ),

        const SizedBox(height: 22),

        CustomTitle(
          title: 'Brands',
          onPressed: () {
            GoRouter.of(context).push(Routes.allBrandsScreen);
          },
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .125,
          child: const BrandsBlocBuilder(),
        ),

        const SizedBox(height: 14),

        CustomTitle(
          title: 'All Products',
          onPressed: () {
            GoRouter.of(context).push(Routes.allProductsScreen);
          },
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: height * .22,
          child: const AllProductsBlocBuilder(),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
