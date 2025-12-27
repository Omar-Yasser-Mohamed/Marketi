import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/core/widgets/custom_loading_indicator.dart';
import 'package:marketi/features/favourites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:marketi/features/favourites/presentation/widgets/favorites_empty_widget.dart';
import 'package:marketi/features/favourites/presentation/widgets/favorites_gird_view.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class FavoritesBlocConsumer extends StatefulWidget {
  const FavoritesBlocConsumer({
    super.key,
  });

  @override
  State<FavoritesBlocConsumer> createState() => _FavoritesBlocConsumerState();
}

class _FavoritesBlocConsumerState extends State<FavoritesBlocConsumer> {
  List<ProductEntity> favProducts = [];

  @override
  void initState() {
    super.initState();
    // Initialize with current data if available
    final cubit = context.read<FavoritesCubit>();
    if (cubit.state is FavoritesSuccess) {
      favProducts = (cubit.state as FavoritesSuccess).products;
    } else {
      favProducts = cubit.favProducts;
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Clean up resources if needed
  favProducts.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is FavoritesSuccess) {
          favProducts = state.products;
        }
      },
      builder: (context, state) {
        if (state is FavoritesSuccess || state is FavoritesToggleLoading) {
          if (favProducts.isNotEmpty) {
            return FavoritesGirdView(
              favProducts: favProducts,
            );
          } else {
            return const FavoritesEmptyWidget();
          }
        } else if (state is FavoritesFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CustomLoadingIndicator(
            height: 30,
            width: 30,
          ),
        );
      },
    );
  }
}
