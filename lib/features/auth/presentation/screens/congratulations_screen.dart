import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/app_button.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: context.screenHeight * 0.18),
            Image.asset(
              AppImages.congratulationsLogo,
              height: context.screenHeight * .3,
            ),

            const SizedBox(height: 22),

            Text(
              context.l10n.congratulations,
              style: AppTextStyles.enM24.copyWith(
                color: context.primaryColor,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.p),
              child: Text(
                context.l10n.passwordUpdatedMessage,
                textAlign: TextAlign.center,
                style: AppTextStyles.enM16.copyWith(
                  color: context.primaryColor,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.p),
              child: AppButton(
                text: context.l10n.login,
                onPressed: () {
                  context.go(AppRoutes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
