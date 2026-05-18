import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_factory.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/category_item.dart';

class CategoriesGridView extends StatefulWidget {
  const CategoriesGridView({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      await context.read<CategoriesCubit>().loadMoreCategories();
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
        childAspectRatio: 1.2,
      ),
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(
              AppRoutes.categoryProductsScreen,
              extra: widget.categories[index],
            );
          },
          child: CategoryItem(
            category: widget.categories[index],
          ),
        );
      },
    );
  }
}
