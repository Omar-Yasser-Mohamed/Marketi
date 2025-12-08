import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/features/auth/presentation/widgets/custom_icon_svg_button.dart';
import 'package:marketi/features/auth/presentation/widgets/login_widgets/login_footer_section.dart';
import 'package:marketi/features/auth/presentation/widgets/login_widgets/login_header_section.dart';
import 'package:marketi/features/auth/presentation/widgets/login_widgets/login_section.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        const LoginHeaderSection(),
        const LoginSection(),
        const SizedBox(height: 14),
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
        const SizedBox(height: 17),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconSvgButton(
              iconPath: AppIcons.google,
            ),
            CustomIconSvgButton(
              iconPath: AppIcons.apple,
            ),
            CustomIconSvgButton(
              iconPath: AppIcons.facebook,
            ),
          ],
        ),
        const SizedBox(height: 14),
        const LoginFooterSection(),
      ],
    );
  }
}
