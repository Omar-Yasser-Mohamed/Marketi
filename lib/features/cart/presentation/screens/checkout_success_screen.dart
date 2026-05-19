import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/app_button.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.p),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                AppImages.checkoutSuccess,
                height: context.screenHeight * 0.3,
              ),
              const SizedBox(height: 32),
              Text(
                context.l10n.orderPlacedSuccessfully,
                textAlign: TextAlign.center,
                style: AppTextStyles.enM24.copyWith(
                  color: context.textColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                context.l10n.orderSuccessDescription,
                textAlign: TextAlign.center,
                style: AppTextStyles.enM16.copyWith(
                  color: context.textColor.withValues(alpha: 0.7),
                ),
              ),
              const Spacer(),
              AppButton(
                text: context.l10n.continueShopping,
                onPressed: () {
                  context.go(AppRoutes.homeScreen);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
