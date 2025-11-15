import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_icon_button.dart';
import 'package:marketi/features/auth/presentation/widgets/register_widgets/register_header_section.dart';
import 'package:marketi/features/auth/presentation/widgets/register_widgets/signup_section.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 52),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: RegisterHeaderSection(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SignupSection(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Or Continue With',
              style: TextStyles.normalTextStyle.copyWith(
                color: ColorStyles.navy,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              iconPath: AppIcons.google,
            ),
            CustomIconButton(
              iconPath: AppIcons.apple,
            ),
            CustomIconButton(
              iconPath: AppIcons.facebook,
            ),
          ],
        ),
      ],
    );
  }
}
