import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/auth/domain/services/email_flow.dart';
import 'package:marketi/features/auth/presentation/widgets/verification_widgets/resend_timer.dart';
import 'package:marketi/features/auth/presentation/widgets/verification_widgets/verification_section.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.04),
          Image.asset(
            AppImages.verificationLogo,
            height: size.height * 0.3,
          ),

          const SizedBox(height: 22),

          // Desc
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.p),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: context.l10n.verification_code_desc,
                style: AppTextStyles.enM16.copyWith(
                  color: context.textColor,
                ),
                children: [
                  TextSpan(
                    text: getIt<EmailFlow>().email,
                    style: AppTextStyles.enM16.copyWith(
                      color: context.isLightMode
                          ? AppColors.primary
                          : AppColors.lightBlue900,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 22),

          const VerificationSection(),

          const SizedBox(height: 22),

          const ResendTimer(),

          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
