import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/brands_grid_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/categories_grid_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/home_header.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/home_products_list_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/offers_carousel.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/popular_products_list_view.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          8.verticalSizedBox,

          // hi & search
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.p),
            child: const HomeHeader(),
          ),

          14.verticalSizedBox,

          // Offers
          const OffersCarousel(),

          14.verticalSizedBox,

          // Popular Products
          SectionTitle(title: context.l10n.popular_product),

          8.verticalSizedBox,

          SizedBox(
            height: 150.h,
            child: const PopularProductsListView(),
          ),

          // Category
          14.verticalSizedBox,

          SectionTitle(title: context.l10n.category),

          8.verticalSizedBox,

          const CategoriesGridView(),

          14.verticalSizedBox,

          SectionTitle(title: context.l10n.bestForYou),

          8.verticalSizedBox,

          SizedBox(
            height: 200.h,
            child: const HomeProductsListView(),
          ),

          14.verticalSizedBox,

          // Brands
          SectionTitle(title: context.l10n.brands),

          8.verticalSizedBox,

          const BrandsGridView(),

          14.verticalSizedBox,

          // All Products
          SectionTitle(title: context.l10n.allProducts),

          8.verticalSizedBox,

          SizedBox(
            height: 200.h,
            child: const HomeProductsListView(),
          ),

          18.verticalSizedBox,
        ],
      ),
    );
  }
}
