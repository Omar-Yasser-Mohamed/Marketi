import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/presentation/cubits/popular_products_cubit/popular_products_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/popular_products_grid_view.dart';

class PopularProductsGridViewBlocConsumer extends StatefulWidget {
  const PopularProductsGridViewBlocConsumer({super.key});

  @override
  State<PopularProductsGridViewBlocConsumer> createState() =>
      _PopularProductsGridViewBlocConsumerState();
}

class _PopularProductsGridViewBlocConsumerState
    extends State<PopularProductsGridViewBlocConsumer> {
  List<ProductEntity> products = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularProductsCubit, PopularProductsState>(
      listener: (context, state) {
        if (state is PopularProductsSuccess) {
          products.addAll(state.products);
        } else if (state is PopularProductsPaginatonFailure) {
          CherryToastMsgs.showErrorToast(context, 'Error!', state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is PopularProductsSuccess ||
            state is PopularProductsPagiantionLoading ||
            state is PopularProductsPaginatonFailure) {
          return PopularProductsGridView(products: products);
        } else if (state is PopularProductsFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
