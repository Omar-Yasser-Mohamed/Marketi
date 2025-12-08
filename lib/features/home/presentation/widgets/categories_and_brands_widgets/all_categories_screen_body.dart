import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/cubits/all_categories_cubit/all_categories_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/categories_and_brands_widgets/categories_grid_view_bloc_builder.dart';

class AllCategoriesScreenBody extends StatefulWidget {
  const AllCategoriesScreenBody({super.key});

  @override
  State<AllCategoriesScreenBody> createState() =>
      _AllCategoriesScreenBodyState();
}

class _AllCategoriesScreenBodyState extends State<AllCategoriesScreenBody> {
  Timer? _debounce;

  void _search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        BlocProvider.of<AllCategoriesCubit>(
          context,
        ).searchForCategory(query: query);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 58),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomCenterAppBar(
                title: 'Categories',
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: CustomSearchTextField(
                  onChanged: _search,
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),

        const Expanded(
          child: CategoriesGridViewBlocBuilder(),
        ),
      ],
    );
  }
}
