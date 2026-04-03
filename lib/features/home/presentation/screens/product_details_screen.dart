import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/home/presentation/cubits/product_details_cubit/product_details_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_details_screen_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsSuccess) {
            final product = state.product;

            return ProductDetailsScreenBody(product: product);
          } else if (state is ProductDetailsFailure) {
            final error = FailureUiMapper.map(
              context: context,
              failure: state.failure,
            );
            return CustomFailureWidget(error: error);
          }
          return const Center(child: CircularProgressIndicator()); //TODO: Change loading widget
        },
      ),
    );
  }
}
