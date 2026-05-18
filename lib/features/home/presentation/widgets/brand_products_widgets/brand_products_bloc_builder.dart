import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/home/presentation/cubits/products_cubit/products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/brand_products_widgets/brand_products_list_view.dart';

class BrandProductsBlocBuilder extends StatelessWidget {
  const BrandProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.isLoading && state.products.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state.failure != null) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure!,
          );
          return CustomFailureWidget(error: error);
        } else if (state.products.isEmpty) {
          return Center(child: Text(context.l10n.noProductsFound));
        }
        return BrandProductsListView(products: state.products);
      },
    );
  }
}
