import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          context.push(AppRoutes.forgetPassword);
        },
        child: Text(
          context.l10n.forgot_password_ques,
          style: AppTextStyles.enM12.copyWith(
            color: context.isLightMode
                ? AppColors.primary
                : AppColors.lightBlue700,
            decoration: context.isDarkMode ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }
}
