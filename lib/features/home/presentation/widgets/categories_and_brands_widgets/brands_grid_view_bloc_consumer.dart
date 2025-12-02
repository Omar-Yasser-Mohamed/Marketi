import 'package:cherry_toast_msgs/cherry_toast_msgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/presentation/cubits/all_brands_cubit/all_brands_cubit.dart';
import 'package:marketi/features/home/presentation/widgets/categories_and_brands_widgets/custom_brands_grid_view.dart';

class BrandsGridViewBlocConsumer extends StatefulWidget {
  const BrandsGridViewBlocConsumer({
    super.key,
  });

  @override
  State<BrandsGridViewBlocConsumer> createState() =>
      _BrandsGridViewBlocConsumerState();
}

class _BrandsGridViewBlocConsumerState
    extends State<BrandsGridViewBlocConsumer> {
  List<BrandEntity> brands = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllBrandsCubit, AllBrandsState>(
      listener: (context, state) {
        if (state is AllBrandsSuccess) {
          brands.addAll(state.brands);
        } else if (state is AllBrandsPaginationFailure) {
          CherryToastMsgs.showErrorToast(context, 'Error!', state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is AllBrandsSuccess ||
            state is AllBrandsPaginationLoading ||
            state is AllBrandsPaginationFailure) {
          return CustomBrandsGridView(brands: brands);
        } else if (state is AllBrandsFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
