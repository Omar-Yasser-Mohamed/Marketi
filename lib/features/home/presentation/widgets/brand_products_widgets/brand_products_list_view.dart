import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/domain/enums/products_type.dart';
import 'package:marketi/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/product_card_tile.dart';

class BrandProductsListView extends StatefulWidget {
  const BrandProductsListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  State<BrandProductsListView> createState() => _BrandProductsListViewState();
}

class _BrandProductsListViewState extends State<BrandProductsListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    final BrandEntity brand =
        GoRouterState.of(context).extra as BrandEntity;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      await context.read<ProductsCubit>().loadMore(
        type: ProductsType.brand,
        brandId: brand.id,
      );
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
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(
        left: 14.p,
        right: 14.p,
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return ProductCardTile(product: widget.products[index]);
      },
    );
  }
}
