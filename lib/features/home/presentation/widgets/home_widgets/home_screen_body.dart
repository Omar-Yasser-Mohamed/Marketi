import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

import 'brands_grid_view.dart';
import 'categories_grid_view.dart';
import 'home_header.dart';
import 'home_products_list_view.dart';
import 'offers_carousel.dart';
import 'popular_products_list_view.dart';
import 'section_title.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
    required this.popularProducts,
    required this.categories,
    required this.bestProducts,
    required this.brands,
    required this.allProducts,
  });

  final List<ProductEntity> popularProducts;
  final List<CategoryEntity> categories;
  final List<ProductEntity> bestProducts;
  final List<BrandEntity> brands;
  final List<ProductEntity> allProducts;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          child: PopularProductsListView(
            products: popularProducts,
          ),
        ),

        // Category
        14.verticalSizedBox,

        SectionTitle(title: context.l10n.category),

        8.verticalSizedBox,

        CategoriesGridView(
          categories: categories,
        ),

        14.verticalSizedBox,

        SectionTitle(title: context.l10n.bestForYou),

        8.verticalSizedBox,

        // best
        SizedBox(
          height: 200.h,
          child: HomeProductsListView(
            products: bestProducts,
          ),
        ),

        14.verticalSizedBox,

        // Brands
        SectionTitle(title: context.l10n.brands),

        8.verticalSizedBox,

        BrandsGridView(
          brands: brands,
        ),

        14.verticalSizedBox,

        // All Products
        SectionTitle(title: context.l10n.allProducts),

        8.verticalSizedBox,

        SizedBox(
          height: 200.h,
          child: HomeProductsListView(
            products: allProducts,
          ),
        ),

        18.verticalSizedBox,
      ],
    );
  }
}
