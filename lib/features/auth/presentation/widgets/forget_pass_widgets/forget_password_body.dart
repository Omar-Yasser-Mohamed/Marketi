import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/forget_pass_widgets/forget_pass_section.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Image.asset(
            AppImages.forgotPasswordLogo,
            height: size.height * 0.3,
          ),

          const SizedBox(height: 22),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.p),
            child: Text(
              context.l10n.forgot_password_desc,
              style: AppTextStyles.enM16.copyWith(
                color: context.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          const ForgetPassSection(),
        ],
      ),
    );
  }
}
