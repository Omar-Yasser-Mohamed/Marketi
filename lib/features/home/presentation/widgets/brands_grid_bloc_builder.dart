import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/presentation/cubits/brands_cubit/brands_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/brands_grid_view.dart';
import 'package:marketi/features/home/presentation/widgets/brands_shimmer_grid.dart';

@lazySingleton
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  error.image,
                  height: 350.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.p),
                  child: Text(
                    error.message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.enSb16.copyWith(
                      color: context.textColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state.brands.isEmpty) {
          return const Center(child: Text('No brands found'));
        }
        return BrandsGridView(brands: state.brands);
      },
    );
  }
}
