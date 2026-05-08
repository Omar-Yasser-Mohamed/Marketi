import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/app_button.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 14.p, vertical: 30),
      child: Column(
        children: [
          Image.asset(
            AppImages.emptyCart,
            height: 270.h,
          ),

          const SizedBox(height: 22),

          Text(
            context.l10n.yourCartIsEmpty,
            style: AppTextStyles.enM24.copyWith(
              color: context.textColor,
            ),
          ),

          const SizedBox(height: 28),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: Text(
              context.l10n.cartEmptyDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.enM16.copyWith(
                color: const Color(0xff51526C),
              ),
            ),
          ),

          30.verticalSizedBox,

          AppButton(
            text: context.l10n.startShopping,
            onPressed: () {
              context.go(AppRoutes.homeScreen);
            },
            height: 48,
          ),
        ],
      ),
    );
  }
}
