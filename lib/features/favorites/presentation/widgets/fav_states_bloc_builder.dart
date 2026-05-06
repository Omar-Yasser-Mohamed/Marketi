import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart';
import 'package:marketi/features/favorites/presentation/widgets/empty_fav_screen.dart';
import 'package:marketi/features/favorites/presentation/widgets/fav_screen_body.dart';

class FavStatesBlocBuilder extends StatelessWidget {
  const FavStatesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return CustomFailureWidget(error: error);
        } else if (state is FavSuccess || state is FavActionLoading) {
          final favProducts = context.read<FavCubit>().products;
          if (favProducts.isEmpty) {
            return const EmptyFavScreen();
          }
          return FavScreenBody(products: favProducts);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
