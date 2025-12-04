import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_button.dart';

class EmptySearchResult extends StatelessWidget {
  const EmptySearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),

          Image.asset(
            AppImages.empty,
            fit: BoxFit.fill,
            height: height * .31,
          ),

          const SizedBox(height: 22),

          Text(
            'Oops Not Found!',
            style: TextStyles.enM26.copyWith(
              color: ColorStyles.darkBlue900,
            ),
          ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Text(
              'Check our big offers, fresh products and fill your cart with items',
              textAlign: TextAlign.center,
              style: TextStyles.enM18.copyWith(
                color: const Color(0xff51526C),
              ),
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CustomButton(
              onPressed: () {
                GoRouter.of(context).go(Routes.homeRootScreen);
              },
              text: 'Continue Shopping',
            ),
          ),
        ],
      ),
    );
  }
}
