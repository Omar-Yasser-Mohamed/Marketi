import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/presentation/cubits/all_products_cubit/all_product_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/all_products_grid_view.dart';

class AllProductsGridViewBlocBuilder extends StatelessWidget {
  const AllProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductState>(
      builder: (context, state) {
        if (state is AllProductSuccess) {
          return AllProductsGridView(
            products: state.products,
          );
        } else if (state is AllProductFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
