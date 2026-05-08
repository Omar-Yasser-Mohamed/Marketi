import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_widgets/checkout_screen_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.checkout,
          style: AppTextStyles.enSb20,
        ),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ArrowBackButton(),
        ),
        leadingWidth: 80,
        backgroundColor: context.backgroundColor,
        elevation: 4,
        scrolledUnderElevation: 4,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.primary.withValues(alpha: 0.04),
      ),
      body: const CheckoutScreenBody(),
    );
  }
}
