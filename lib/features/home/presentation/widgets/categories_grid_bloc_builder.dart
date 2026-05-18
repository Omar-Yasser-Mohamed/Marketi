import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/home/presentation/cubits/categories_cubit/categories_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/categories_grid_view.dart';
import 'package:marketi/features/home/presentation/widgets/categories_shimmer_grid.dart';

class CategoriesGridBlocBuilder extends StatelessWidget {
  const CategoriesGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state.isLoading && state.categories.isEmpty) {
          return const CategoriesShimmerGrid();
        } else if (state.failure != null) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure!,
          );
          return CustomFailureWidget(error: error);
        } else if (state.categories.isEmpty) {
          return Center(child: Text(context.l10n.noCategoriesFound));
        }
        return CategoriesGridView(categories: state.categories);
      },
    );
  }
}
