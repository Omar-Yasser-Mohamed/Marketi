import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/core/widgets/fav_button.dart';
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final favCubit = context.read<FavCubit>();
    return Container(
      padding: EdgeInsets.only(left: 14.p, right: 14.p, bottom: 8),
      decoration: BoxDecoration(
        color: context.isLightMode ? Colors.white : AppColors.primaryDark,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue100.withValues(alpha: .04),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const ArrowBackButton(),

          const Spacer(),

          BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              final isFav = favCubit.isFav(productId);
              return FavButton(
                isFav: isFav,
                padding: 8,
                onTap: () {
                  if (isFav) {
                    favCubit.removeFavProduct(productId);
                  } else {
                    favCubit.addFavProduct(productId);
                  }
                },
              );
            },
          ),

          16.horizontalSizedBox,

          const Icon(Icons.shopping_cart_outlined),

          4.horizontalSizedBox,
        ],
      ),
    );
  }
}
