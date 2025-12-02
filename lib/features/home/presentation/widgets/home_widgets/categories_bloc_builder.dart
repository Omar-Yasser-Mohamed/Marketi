import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/presentation/cubits/all_categories_cubit/all_categories_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/categories_grid_view.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
      builder: (context, state) {
        if (state is AllCategoriesSuccess) {
          return CategoriesGridView(
            categories: state.categories,
          );
        } else if (state is AllCategoriesFailure) {
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
