import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_continue_with_text.dart';
import 'package:marketi/features/auth/presentation/widgets/google_login_button.dart';
import 'package:marketi/features/auth/presentation/widgets/login_widgets/login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),

            Hero(
              tag: 'logo',
              child: Image.asset(
                AppImages.loginLogo,
                color: context.isLightMode ? AppColors.primary : Colors.white,
              ),
            ),

            const SizedBox(height: 28),

            const LoginSection(),

            const SizedBox(height: 12),

            // Or continue with text
            const CustomContinueWithText(),

            const SizedBox(height: 20),

            // Google Login button
            const GoogleLoginButton(),

            const SizedBox(height: 24),

            Text.rich(
              TextSpan(
                text: "${context.l10n.are_you_new} ",
                style: AppTextStyles.enR12.copyWith(
                  color: context.isLightMode
                      ? AppColors.darkBlue900
                      : AppColors.lightBlue900,
                ),
                children: [
                  TextSpan(
                    text: context.l10n.register,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push(AppRoutes.signup);
                      },
                    style: AppTextStyles.enM12.copyWith(
                      color: context.isLightMode
                          ? AppColors.primary
                          : AppColors.lightBlue700,
                      decoration: context.isDarkMode
                          ? TextDecoration.underline
                          : null,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
