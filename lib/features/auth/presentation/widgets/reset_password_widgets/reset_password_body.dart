import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/reset_password_widgets/reset_password_section.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * .04),
          Image.asset(
            AppImages.createNewPasswordLogo,
            height: context.screenHeight * 0.3,
          ),

          const SizedBox(height: 22),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.p),
            child: Text(
              context.l10n.newPasswordHint,
              textAlign: TextAlign.center,
              style: AppTextStyles.enM16.copyWith(
                color: context.textColor,
              ),
            ),
          ),

          const SizedBox(height: 22),

          const ResetPasswordSection(),
        ],
      ),
    );
  }
}
