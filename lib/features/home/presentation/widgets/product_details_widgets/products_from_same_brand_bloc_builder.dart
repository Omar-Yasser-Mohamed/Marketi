import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/products_from_same_brand_list_view.dart';

class ProductsFromSameBrandBlocBuilder extends StatelessWidget {
  const ProductsFromSameBrandBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.isLoading && state.products.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else if (state.failure != null) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure!,
          );
          return Center(
            child: Text(
              error.message,
              style: AppTextStyles.enM16.copyWith(
                color: context.textColor,
              ),
            ),
          );
        } else if (state.products.isEmpty) {
          return Center(
            child: Text(context.l10n.noProductsFound),
          );
        }
        return ProductsFromSameBrandListView(products: state.products);
      },
    );
  }
}
