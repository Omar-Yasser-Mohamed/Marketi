import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';
import 'package:marketi/features/home/presentation/cubits/all_categories_cubit/all_categories_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/categories_and_brands_widgets/custom_categories_grid_view.dart';

class CategoriesGridViewBlocBuilder extends StatefulWidget {
  const CategoriesGridViewBlocBuilder({
    super.key,
  });

  @override
  State<CategoriesGridViewBlocBuilder> createState() =>
      _CategoriesGridViewBlocBuilderState();
}

class _CategoriesGridViewBlocBuilderState
    extends State<CategoriesGridViewBlocBuilder> {
  List<CategoryEntity> categories = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
      builder: (context, state) {
        if (state is AllCategoriesSuccess) {
          return CustomCategoriesGridView(
            categories: state.categories,
          );
        } else if (state is AllCategoriesFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
