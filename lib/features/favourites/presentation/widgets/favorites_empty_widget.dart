import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class FavoritesEmptyWidget extends StatelessWidget {
  const FavoritesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          Image.asset(
            AppImages.favoritesEmpty,
            fit: BoxFit.fill,
            height: height * .31,
          ),

          const SizedBox(height: 22),

          Text(
            'Your Favorites is Empty',
            style: TextStyles.enM26.copyWith(
              color: ColorStyles.darkBlue900,
            ),
          ),
        ],
      ),
    );
  }
}
