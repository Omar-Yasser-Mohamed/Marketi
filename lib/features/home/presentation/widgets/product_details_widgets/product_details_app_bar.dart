import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/core/widgets/fav_button.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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

          const FavButton(
            isFav: true,
            padding: 8,
          ),

          12.horizontalSizedBox,

          const Icon(Icons.shopping_cart_outlined),
        ],
      ),
    );
  }
}
