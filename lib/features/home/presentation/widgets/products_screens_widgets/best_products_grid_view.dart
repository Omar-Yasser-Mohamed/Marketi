import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/presentation/cubits/best_products_cubit/best_products_cubit.dart';

class BestProductsGridView extends StatefulWidget {
  const BestProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  State<BestProductsGridView> createState() => _BestProductsGridViewState();
}

class _BestProductsGridViewState extends State<BestProductsGridView> {
  int nextPage = 2;
  bool isLoading = false;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    final currentPosition = scrollController.position.pixels;
    final maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition > 0.8 * maxPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<BestProductsCubit>(
          context,
        ).getBestProducts(page: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Text(
              'All Products',
              style: TextStyles.enSb22.copyWith(
                color: ColorStyles.darkBlue900,
              ),
            ),
          ),

          GridView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 24,
              left: 14,
              right: 14,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
              childAspectRatio: 1.98 / 2.1,
            ),
            itemCount: widget.products.length,
            itemBuilder: (context, index) => ProductItem(
              aspectRatio: 1.98 / 2,
              showAddButton: true,
              margin: EdgeInsets.zero,
              product: widget.products[index],
            ),
          ),
        ],
      ),
    );
  }
}
