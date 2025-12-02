import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/presentation/cubits/all_products_cubit/all_product_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/all_products_grid_view.dart';

class AllProductsGridViewBlocConsumer extends StatefulWidget {
  const AllProductsGridViewBlocConsumer({
    super.key,
  });

  @override
  State<AllProductsGridViewBlocConsumer> createState() =>
      _AllProductsGridViewBlocConsumerState();
}

class _AllProductsGridViewBlocConsumerState
    extends State<AllProductsGridViewBlocConsumer> {
  List<ProductEntity> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllProductCubit, AllProductState>(
      listener: (context, state) {
        if (state is AllProductSuccess) {
          products.addAll(state.products);
        } else if (state is AllProductPaginationFailure) {
          CherryToastMsgs.showErrorToast(context, 'Error', state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is AllProductSuccess ||
            state is AllProductPaginationLoading ||
            state is AllProductPaginationFailure) {
          return AllProductsGridView(
            products: products,
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
