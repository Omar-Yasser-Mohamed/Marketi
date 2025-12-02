import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/presentation/cubits/best_products_cubit/best_products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/best_products_grid_view.dart';

class BestProductsGridViewBlocConsumer extends StatefulWidget {
  const BestProductsGridViewBlocConsumer({
    super.key,
  });

  @override
  State<BestProductsGridViewBlocConsumer> createState() =>
      _BestProductsGridViewBlocConsumerState();
}

class _BestProductsGridViewBlocConsumerState
    extends State<BestProductsGridViewBlocConsumer> {
  List<ProductEntity> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestProductsCubit, BestProductsState>(
      listener: (context, state) {
        if (state is BestProductsSuccess) {
          products.addAll(state.products);
        } else if (state is BestProductsPaginationFailure) {
          CherryToastMsgs.showErrorToast(context, 'Error!', state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is BestProductsSuccess ||
            state is BestProductsPaginationLoading ||
            state is BestProductsPaginationFailure) {
          return BestProductsGridView(products: products);
        } else if (state is BestProductsFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
