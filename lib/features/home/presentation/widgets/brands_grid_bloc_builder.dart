import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/home/presentation/cubits/brands_cubit/brands_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/brands_grid_view.dart';
import 'package:marketi/features/home/presentation/widgets/brands_shimmer_grid.dart';

class BrandsGridBlocBuilder extends StatelessWidget {
  const BrandsGridBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state.isLoading && state.brands.isEmpty) {
          return const BrandsShimmerGrid();
        } else if (state.failure != null) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure!,
          );
          return CustomFailureWidget(error: error);
        } else if (state.brands.isEmpty) {
          return Center(child: Text(context.l10n.noBrandsFound));
        }
        return BrandsGridView(brands: state.brands);
      },
    );
  }
}
