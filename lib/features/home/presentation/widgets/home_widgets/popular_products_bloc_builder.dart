import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/presentation/cubits/popular_products_cubit/popular_products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/popular_products_list_view.dart';

class PopularProductsBlocBuilder extends StatelessWidget {
  const PopularProductsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularProductsCubit, PopularProductsState>(
      builder: (context, state) {
        if (state is PopularProductsSuccess) {
          return  PopularProductsListView(
            products: state.products,
          );
        } else if (state is PopularProductsFailure) {
          return CustomErrorMessage(
            text: state.errorMsg,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
