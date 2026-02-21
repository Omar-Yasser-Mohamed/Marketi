import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/home_products_list_view.dart';

class ProductsListViewBlocBuilder extends StatelessWidget {
  const ProductsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          final products = state.products;
          return HomeProductsListView(
            products: products,
          );
        } else if (state is HomeFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return SvgPicture.asset(error.image);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
