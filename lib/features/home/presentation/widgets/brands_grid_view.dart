import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_factory.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/category_item.dart';

import '../cubits/brands_cubit/brands_cubit.dart';

class BrandsGridView extends StatefulWidget {
  const BrandsGridView({super.key, required this.brands});
  final List<BrandEntity> brands;

  @override
  State<BrandsGridView> createState() => _BrandsGridViewState();
}

class _BrandsGridViewState extends State<BrandsGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      await context.read<BrandsCubit>().loadMoreBrands();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strategy = ProductsGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(
        left: 14.p,
        right: 14.p,
        top: 8,
        bottom: 28,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 18,
        mainAxisSpacing: 8,
        childAspectRatio: 1.4,
      ),
      itemCount: widget.brands.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          category: CategoryEntity(
            id: widget.brands[index].id,
            name: widget.brands[index].name,
            image: widget.brands[index].image,
          ),
        );
      },
    );
  }
}
