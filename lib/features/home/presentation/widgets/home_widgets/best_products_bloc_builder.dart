import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/presentation/cubits/best_products_cubit/best_products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/best_products_for_you_list_view.dart';

class BestProductsBlocBuilder extends StatelessWidget {
  const BestProductsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestProductsCubit, BestProductsState>(
      builder: (context, state) {
        if (state is BestProductsSuccess) {
          return BestProductsForYouListView(
            products: state.products,
          );
        } else if (state is BestProductsFailure) {
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
