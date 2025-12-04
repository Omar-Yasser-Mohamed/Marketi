import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/core/widgets/custom_search_text_filed.dart';
import 'package:marketi/features/home/presentation/cubits/all_brands_cubit/all_brands_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/categories_and_brands_widgets/brands_grid_view_bloc_builder.dart';

class AllBrandsScreenBody extends StatefulWidget {
  const AllBrandsScreenBody({super.key});

  @override
  State<AllBrandsScreenBody> createState() => _AllBrandsScreenBodyState();
}

class _AllBrandsScreenBodyState extends State<AllBrandsScreenBody> {
  Timer? _debounce;

  void _search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        BlocProvider.of<AllBrandsCubit>(
          context,
        ).searchForBrand(query: query);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 58),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomCenterAppBar(
                title: 'Brands',
              ),
              const SizedBox(height: 16),
              CustomSearchTextField(
                onChanged: _search,
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),

        const Expanded(
          child: BrandsGridViewBlocBuilder(),
        ),
      ],
    );
  }
}
