import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/presentation/cubits/all_brands_cubit/all_brands_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/brands_list.dart';

class BrandsBlocBuilder extends StatelessWidget {
  const BrandsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBrandsCubit, AllBrandsState>(
      builder: (context, state) {
        if (state is AllBrandsSuccess) {
          return BrandsList(
            brands: state.brands,
          );
        } else if (state is AllBrandsFailure) {
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
